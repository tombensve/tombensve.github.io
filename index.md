[Go to my GitHub Repos](https://github.com/tombensve/)

# My GitHub repos

Are partly for need, but mostly a place were I'm having fun and stimulating my brain.

It is so far only Java, Groovy and some JS here. I have decided to use Groovy as much as possible, because it is a superb language and completely compatible with Java! You can write way better code in Groovy than with Java, and Groovy have always had features that Java didn't get until 1.8, and Groovy still does it better! The people behind Groovy know what they are doing. I'm a big fan!

Later versions of Groovy (still allowing 1.8 byttecocde to be produced) supports JDK 17 records, even for 1.8 code where it solves it under the surface in a way you don't have to care about! 

There is a reason that most of my code is done in Groovy! Groovy also allows you to specify the byte code level to produce when building, independent of the code! I currently suppport 1.8 and 11 for my groovy code on GitHub. I'm currently considering also supporting 17, assuming that I can take current code and just produce version 17 bytecode. 

# Binaries

My binaries are now made available on [Repsy.io](https://repsy.io/), which is as easy as Bintray was to setup and use. JFrog did offer free Artifactory instances for open source code after they shut down bintray. I got such an account and tried to set it up, but finally gave upp. Far too incomprehensible! I have been publishing binaries on my private web server, but a repo like Repsy is by far better.

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

# Why not maven central ? 

Well, I did that once and that was an absolutely horrible process to go through! I sent a mail to maven users list saying
that releasing to maven central must be an easier process. I got only one answer, and that was from JFrog asking if I had seen bintray. I had not,
and took a look. I became a user immediately. JFrog understood how easy this process really should be!! I have no idea why they shut down the
bintray service, it was one of the best I've ever used! 

Submitting to maven central have (from googling) become a little bit easier, but after reading up on the whole procedure I conclude that  it is still a far too complicated process. My GitHub code is mostly for fun and it need to continue to be that. 

As seen above I'm now using a free account on [Repsy.io](https://repsy.io/) to share my binaries. Its as easy as Bintray was.

[My GitHub Repos](https://github.com/tombensve/)

----

# Blogish

[My Craft based attempt to mini blog for myself and whoever might be interested.](https://tombensvebloggish.craft.me/)

It will be mostly development related, and very sparsely updated. When I run into a problem and then solve it I will make an entry of the problem and solution. Mostly for myself, but it might also help others with same problem. 

# History

Professionally I wrote C code in the beginning, but became a consultant later and happend to be in a project using Java 1.0. Be glad if you missd that! But Java has gotten better and better over time. I am however not in agreement with Oracles descicion to skip backwards compatibility from 12 and upp! I think that was stupid! So far no place I've been as a consultant have gone past Java 11! That says something IMHO. Java 6 was seen as a very good release. That  is because it took 4 or 5 years until Java 7. That provided stability! 

Here are some hardware and OS:es I've used in my early years.

- [Sinclair ZX-80 & zx-81 machines](https://en.wikipedia.org/wiki/ZX80)
- [TRS-80 Color Computer](https://en.wikipedia.org/wiki/TRS-80_Color_Computer)
- [OS9](https://www.microware.com/)



