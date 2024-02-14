[Go to my GitHub Repos](https://github.com/tombensve/)

# History

I'm a software developer that wrote my first code on a when I was 12. Here is some machine and OS I've used.

- [Sinclair ZX-80 machine](https://en.wikipedia.org/wiki/ZX80)
- [TRS-80 Color Computer](https://en.wikipedia.org/wiki/TRS-80_Color_Computer)
- [OS9](https://www.microware.com/)

I wrote C code at the beginning, but became a consultant later and happend to be in a project using Java 1.0.
Be glad if you missd that! But Java has gotten better and better over time. I am however not in agreement with Oracles
descicion to skip backwards compatibility from 12 and upp! I think that was stupid! So far no place I've been
as a consultant have gone past Java 11! That says something IMHO. Java 6 was seen as a very good release. That 
is because it took 4 or 5 years until Java 7. That provided stability! 

## My GitHub repos

Are partly for need, but mostly a place were I'm having fun and stimulating my brain.

It is so far only Java, Groovy and some JS here. I have decided to use Groovy
as much as possible, because it is a superb language and completely compatible 
with Java! You can write way better code in Groovy than with Java, and Groovy have 
always had features that Java didn't get until 1.8, and Groovy still does it 
better! The people behind Groovy know what they are doing. I'm a big fan!

## Binaries

My binaries are now made available on [Repsy.io](https://repsy.io/), which is as easy
as Bintray was to setup and use. JFrog did offer free Artifactory instances for open source
code after they shut down bintray. I got such an account and tried to set it up, but
finally gave upp. Far too incomprehensible! I have been publishing binaries on my private web
server, but a repo like Repsy is by far better.

Here is the configuration needed to access my binaries on Repsy.

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

**Do note that binaries on my old webserver will stop working around April 2024!!**   

_In case you are already using something from me and have the old repository
setup then you need to update to the above!_ 

## Current status

_I have early onset dementia, and are walking on the road to Alzheimers!_ 

This means that I have more time with my GitHub projects, but also that I'm slower, 
quite slower actually. My short term memory really sucks. But I will keep
on coding here for as long as I can. My doctor encourage me to continue this to stimulate 
my brain. This does not mean that I will lower my own requirements, but it will take longer 
to implement them.

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

[My GitHub Repos](https://github.com/tombensve/)

----

# Blogish

These are mostly things I've run into and had to solve, and I decribe it here to help others with
same problems and also future me. 

These are very sporadic!

## Coding related

[IDEA failing build due to some missing StringUtils ? Switch to maven wrapper!](https://www.craft.me/s/lGZUtgdhyazUUA)

[GitHub Projects has become very useful since I last checked!](https://www.craft.me/s/Qu100l9JZkHakZ) I which I had discovered this earlier rather than fight YouTrack<->IDEA!

[Quarkus tip for those new to Quarkus](https://rooms-lie-gal.craft.me/9raYR8WL0547n6)

----

_This is an index.md page and GitHub does not allow a CSS file for markdown documents._

_It is however much easier to edit this within Github in a browser!_
