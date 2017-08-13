---
layout: post
title:  "Using vertx3-eventbus-client (and other JS code) from Typescript."
date:   2017-02-10 18:04:12 +0100
categories: typescript solution vertx3
---

## Intro

Being a long time server side developer I've decided to learn a bit of client side also, starting with Angular 2 which forced me into Typescript also. Angular 2 have been more or less straight forward, but Typescript less so. Maybe because it is relatively new and there is not so much info when googling on things. In general I really like Typescript. Being a Java developer I feel more at home with Typescript than Javascript. 

I decided that rather than playing with dummy code to learn I'll redo a web app I already have, done in Vaadin. That gives me a very clear specification what to do. Vaading of course requires a JEE webcontainer since it uses servlets. With the years, I'm liking JEE less and less. It is starting to feel like an neccesarry evil that can't be avoided. I really did not want to use a JEE webcontainer to serve REST calls, I wanted something smaller, less heavy. 

Fortunately I stumbled upon something __wonderful__: [Vertx 3](http://vertx.io/)\! Really cool\! Really simple to use! So far, just works! The many horrors I've experienced with the Eclipse IDE tend to make me turn around and run when I see the word "Eclipse" anywhere, but Vertx is an Eclipse project and I must say that I have the highest respect for the people behind it! 

Having Vertx on the server side made me decide to use the Vertx EventBus for communication between client and server by sending messages both ways. There is an Vertx3-eventbus-client.js available from the Vertx team to make it usable from Javascript both in node.js and in browsers.

## The problem

 _Now came my big problem:_ I'm coding the client with Angular 2 and Typescript, not Javascript! Since Typescript transpiles (I have found no spellchecker that accepts this as a word) the Typescript code into Javascript code. So in the end it is all Javascript, so this should be trivial, right?

No! The vertx3-eventbus-client documentation said do: 

{% highlight typescript %}
var eb = new EventBus("http://localhost:8080/eventbus", {...});
{% endhighlight %}

So I tried:

{% highlight typescript %}
import { EventBus } from 'vertx3-eventbus-client';
...
this.eventBus = new EventBus("http://localhost:8080/eventbus", {});
{% endhighlight %}

Which resulted in

{% highlight typescript %}
vertx3_eventbus_clinet_1.EventBus is not a constructor!
{% endhighlight %}

I did get the following to work:

{% highlight typescript %}
this.eventBus = EventBus("http://localhost:8080/eventbus", {});
{% endhighlight %}

Note that the _new_ keyword is gone! Here it actually created an instance and it tried to connect! However, as soon as I replaced the hardcoded arguments with variables I got an error very similar to the first error:

{% highlight typescript %}
vertx3_eventbus_clinet_1.EventBus is not a function!
{% endhighlight %}

So I decided that this was probably not the correct way to do it. So I googled, googled, and googled. In the end I was able to add some puzzle pieces of using the Typescript _declare_ keyword. This keyword is apparently there just to handle such situations. You have to _declare_ the Javascript "object" to Typescript. 

Importing the _EventBus_ was also wrong way to go since when run vertx3-eventbus-client.js did not provide what was expected.  

## The solution

I did start with something else, don't remember what, that failed to include all dependencies, but when I switched to WebPack I was able to get all dependencies into my bundle.js only requiring a very simple index.html.

{% highlight html %}
<!DOCTYPE html>
<html>
<head>
    <title>APS Admin Web</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="static/adminweb-bundle.js"></script>

</head>

<body>
<aps-admin-web>Loading...</aps-admin-web>
<hr/>
<!--<router-outlet></router-outlet>-->
</body> 
</html>
{% endhighlight %}

I at first tried the following: 

{% highlight typescript %}
declare class EventBus {
    public constructor( url : string, options : Object);

    public onerror : Function;
    public send(address : string, message : string, headers : Array<string>, replyCallback : Function) : Function;
    public publish(address : string, message : string, headers : Array<string>) : Function;
    public registerHandler(address : string, headers : Array<string>, callback : Function) : Function;
    public unregisterHandler(address : string, headers : Array<string>, callback : Function) : Function;
    public close() : Function;
}
{% endhighlight %} 

This of course did not work! Probably because I'm declaring a Typescript class of something that isn't a Typescript compatible JS code.

So this was a complete bust! So, what to do then ? When failing, pick yourself up and try again, and again util success or something like that. Well my first fail was at googling, so I tried that again, and ... [Success](https://gist.github.com/benorama/93373c3c1c3574732d6cc1b4754aab9f)! It was actually through [this](https://github.com/vert-x3/vertx-stack/issues/61#issuecomment-295259388) were mikeagarza posted the link. The class is created by [benorama](https://gist.github.com/benorama) (Benoit Hediard). Thanks for that!

Here is the small code I used to test:

{% highlight typescript %}
        this.eventBusProvider = new EventBusService();
        this.eventBusProvider.connect("http://192.168.1.60:9080/eventbus/");
        let headers : Array<string>;
        headers = [];
        this.eventBusProvider.publish("aps.adminweb", "{\"content\": \"Hello!\"}", headers);
{% endhighlight %}

I have verified that I can connect and send a message that does arrive using this. This is a clean implementation of the Vertx event bus client done entirely in Typescript. It does not take any args in the constructor, but have a `connect(...)` method instead to make it Angular2 injectable. Very nice.

The following server code sets up the bridge (Groovy code!):
{% highlight groovy %}
            ...
            def inboundPermitted = [address: "aps.adminweb"]
            def outboundPermitted = [address: "aps.adminweb"]
            def options = [
                    inboundPermitteds: [inboundPermitted],
                    outboundPermitteds: [outboundPermitted]
            ] as Map<String, Object>

            // Note that this router is already bound to an HTTP server!
            SockJSHandler sockJSHandler = SockJSHandler.create(this.vertx)
            sockJSHandler.bridge(options) 
            this.router.route("/eventbus/*").handler(sockJSHandler)
    
{% endhighlight %}

 


