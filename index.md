# Tommy Bengt Svenssons (TBS) GitHub repos

I'm a software developer that wrote my first code on a [Sinclair ZX-80 machine](https://en.wikipedia.org/wiki/ZX80)
when I was 12. When I was 13 I got the ZX81, which also could display information on the screen at the same time as
processing! :-). At 14 my family moved from Stockholm, Sweden to Seattle, USA. There I got a [TRS-80 Color Computer](https://en.wikipedia.org/wiki/TRS-80_Color_Computer) made
by Tandy. It had a total of 8 colors! It also had a Motorola 6809 processor and could thereby run the [OS9](https://www.microware.com/) fully
multitasking operating system, very much inspired by unix, and this on a machine with only 32K of memory! 

I  moved back to Sweden when I was 21. Eventually starting my career (after required military service) at Ericsson, 
where I had no problems comprehending the SUN Unix machines since it felt very much like OS9. My college did not 
have unix machines at that time, only a "Mainframe", don't remember brand, with terminals which you had to use for excercises.

I wrote C code at the beginning, but became a consultant later and happend to be in a project using Java 1.0.
Be glad if you missd that! But Java has gotten better and better over time. I am however not in agreement with Oracles
descicion to skip backwards compatibility from 12 and upp! I think that was stupid! So far no place I've been
as a consultant have gone past Java 11! That says something IMHO. Java 6 was seen as a very good release. That 
is because it took 4 or 5 years until Java 7. That provided stability! 

### Current status

_I'm walking on the road to Alzheimers! I'm now on 100% sick leave until retirement._ This means that I have more
time with my GitHub projects, but also that I'm slower. My short term memory really sucks. But I will keep
on coding here for as long as I can. My doctor encourage me to continue this. This does not mean that I 
will lower my own requirements, but it will take longer to implement them.

## My GitHub repos

Are partly for need, but mostly a place were I'm having fun and stimulating my brain.

It is so far only Java, Groovy and some JS here. I have decided to use Groovy
as much as possible, because it is a superb language and completely compatible 
with Java! You can write better code in Groovy than with Java, and Groovy have 
always had features that Java didn't get until 1.8, and Groovy still does it 
better! The people behind Groovy know what they are doing! 

## Binaries

My binaries are now made available on [Repsy.io](https://repsy.io/), which is as easy
as Bintray was to setup and use. JFrog did offer free Artifactory instances for open source
code after they shut down bintray. I got such an account and tried to set it up, but
finally gave upp. Far too incomprehensible! I have been publishing binaries on my private web
server, but a repo like Repsy is by far better.

    <repositories>
        <repository>
            <id>repsy</id>
            <name>tombensve's public Maven Repository on Repsy</name>
            <url>https://repo.repsy.io/mvn/tombensve/natusoft-os</url>
        </repository>
    </repositories>

    <pluginRepositories>
        <pluginRepository>
            <id>repsy</id>
            <name>tombensves public plugin Maven repository on Repsy</name>
            <url>https://repo.repsy.io/mvn/tombensve/natusoft-os</url>
        </pluginRepository>
    </pluginRepositories>    

**Do note that my old webserver will stop working around April 2024!!**    

----

## Why not maven central ? 

Well, I did that once and that was an absolutely
horrible process to go through! I sent a mail to maven users list saying
that releasing to maven central must be an easier process. I got only one
answer, and that was from JFrog asking if I had seen bintray. I had not,
and took a look. I became a user immediately. JFrog understood how easy
this process really should be!! I have no idea why they shut down the
bintray service, it was one of the best I've ever used! 

Submitting to maven central have (from googling) become a little bit
easier, but after reading up on the whole procedure I conclude that 
it is still a far too complicated process. My GitHub code is mostly 
for fun and it need to continue to be that. 

As seen above I'm now using a free account on [Repsy.io](https://repsy.io/) 
to share my binaries. Its as easy as Bintray was.

It is also possible to checkout my repo and build it with `mvn install`. 
After that there will be binaries in your `~/.m2/` folder. 
