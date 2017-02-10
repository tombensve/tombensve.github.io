---
layout: post
title:  "Using_vertx3-eventbus-client_(and_other_JS_code)_from_Typescript."
date:   2017-02-10 18:04:12 +0100
categories: typescript solution vertx3
---

## Intro

Being a long time server side developer I've decided to learn a bit of client side also, starting with Angular 2 which forced me into Typescript also. Angular 2 have been more or less straight forward, but Typescript less so. Maybe because it is relatively new and there is not so much info when googling on things. In general I really like Typescript. Being a Java developer I feel more at home with Typescript than Javascript. 

I decided that rather than playing with dummy code to learn I'll redo a web app I already have, done in Vaadin. That gives me a very clear specification what to do. Vaading of course requires a JEE webcontainer since it uses servlets. With the years, I'm liking JEE less and less. It is starting to feel like an neccesarry evil that can't be avoided. I really did not want to use a JEE webcontainer to serve REST calls, I wanted something smaller, less heavy. 

Fortunately I stumbled upon something __wonderful__: [Vertx 3](http://vertx.io/)\! Really cool! Really simple to use! So far, just works! The many horrors I've experienced with the Eclipse IDE tend to make me turn around and run when I see the word "Eclipse" anywhere, but Vertx is an Eclipse project and I must say that I have the highest respect for the people behind it! 

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

## The solution (so far ...)

First _vertx3-eventbus-client_ and its dependency _sockjs-client_ needs to be loaded. The only solution I found for this was to include them in the index.html file:

{% highlight html %}
<!DOCTYPE html>
<html>
<head>
    <title>APSAdminWeb</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="node_modules/core-js/client/shim.min.js"></script>
    <script src="node_modules/zone.js/dist/zone.js"></script>

    <script src="node_modules/typescript/lib/typescript.js"></script>
    <script src="node_modules/systemjs/dist/system.src.js"></script>

    <script src="systemjs.config.js"></script>

    <!-- Make vertx3-eventbus-client available! -->
    <script src="node_modules/sockjs-client/dist/sockjs.min.js"></script>
    <script src="node_modules/vertx3-eventbus-client/vertx-eventbus.js"></script>

    <script>
        System.import('app').catch(console.error.bind(console));
    </script>
</head>

<body>

<aps-admin-web>Loading...</aps-admin-web>
<hr/>
<!--<router-outlet></router-outlet>-->
</body>
</html>
{% endhighlight %}

The next part, in Typescript, to use the EventBus you have to declare it so that Typescript recognizes it:

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

After this Typescript becomes happy with using EventBus. 

To have one instance of this to inject in Angular 2 components, I made an Vertx3EventBusFacade.ts:

{% highlight typescript %}
import { Injectable       } from "@angular/core";

/**
 * External declaration of EventBus part of vertx3-eventbus-client.
 * <p/>
 * This is required in index.html:
 * <pre>
 *     <script src="node_modules/sockjs-client/dist/sockjs.min.js"></script>
 *     <script src="node_modules/vertx3-eventbus-client/vertx-eventbus.js"></script>
 * </pre>
 */
declare class EventBus {
    public constructor( url : string, options : Object);

    public onerror : Function;
    public send(address : string, message : string, headers : Array<string>, replyCallback : Function) : Function;
    public publish(address : string, message : string, headers : Array<string>) : Function;
    public registerHandler(address : string, headers : Array<string>, callback : Function) : Function;
    public unregisterHandler(address : string, headers : Array<string>, callback : Function) : Function;
    public close() : Function;
}

/**
 * Provides a facade around the JavaScript EventBusProvider code to make it play better with TypeScript.
 */
@Injectable()
export class Vertx3EventBusFacade  {
    //
    // Private Members
    //

    /** Our real eventbus client instance. */
    private eventBus : EventBus;

    private errMsg : string;

    //
    // Constructors
    //

    /**
     * Creates a new EventBusFacate
     * @param url
     * @param options
     */
    public constructor(url : string, options : Object) {
        this.eventBus = new EventBus(url, options); // TS7009 Can't get rid of this red marking, but works fine.
        this.eventBus.onerror = (err: Error) : void => {
            console.log(err);
            this.errMsg = err.toString();
            this.eventBus = null;
        };
    }

    //
    // Methods
    //

    private validate() : void {
        if (this.eventBus == null) {
            throw new Error(`EventBus not connected! [${this.errMsg}]`);
        }
    }

    /**
     * Sends a message that will have one received and one reply.
     *
     * @param address The address of the message.
     * @param message The message to send.
     * @param replyCallback This will be called with a reply to this specific message.
     * @param headers Array of data, depends on implementation. Optional.
     */
    public send(address : string, message : string, replyCallback : Function, headers? : Array<string> ) : Vertx3EventBusFacade {
        this.validate();

        this.eventBus.send(address, message, headers, replyCallback);

        return this;
    }

    /**
     * Publishes a message to all listeners on the bus.
     *
     * @param address The address of the message.
     * @param message The message to publish.
     * @param headers Array of data, depends on implementation. Optional.
     */
    public publish(address : string, message : string, headers? : Array<string>) : Vertx3EventBusFacade {
        this.validate();

        this.eventBus.publish(address, message, headers);

        return this;
    }

    /**
     * Adds a handler for when messages are received.
     *
     * @param address The address to listen to.
     * @param callback The callback that will be called with new messges.
     * @param headers Filter messages on these headers. Optional.
     */
    public addHandler (address : string, callback : Function, headers : Array<string> ) : Vertx3EventBusFacade {
        this.validate();

        this.eventBus.registerHandler(address, headers, callback);

        return this;
    }

    /**
     * Removes a previously added handler.
     *
     * @param address The address to listen to.
     * @param callback The callback that should be removed.
     * @param headers Filer messages on these headers. Optional.
     */
    public removeHandler(address : string, callback : Function, headers : Array<string>) : Vertx3EventBusFacade {
        this.validate();

        this.eventBus.unregisterHandler(address, headers, callback);

        return this;
    }

    /**
     * Closes the connection to the eventbus. After this the instance is useless.
     */
    public close() : void {
        if (this.eventBus != null) {
            this.eventBus.close();
        }
    }
}
{% endhighlight %} 

I haven't made any server side code yet, but the the constructor runs fine and tries to connect, which of course fails due to no service listening yet. Now it is failing in a way I'm expecting it to :-). 

I will update this post later when I have service up and running and tested everything roundtrip. 