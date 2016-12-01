---
layout: post
title:  "A Logical View of writing test code"
date:   2016-12-01 11:49:36 +0100
categories: jekyll update
---
# A Logical View of writing test code

I continually get, well ... shocked, in many cases when I see test code! There are tests for anything and everything, including that java works, that it is possible to add 2 ints and get an int back, etc. Nothing is taken as a given fact, and every single method gets tested no matter what it does. Testing at ridiculous levels does not give you anything, and I would claim do more harm than good. 

I want to provide another view of automatic code testing, thinking logically. I'll start with 2 questions:

* _What is the difference between the main code being tested, and the test code ?_

* _How do you measure the quality of the test code ?_

You do write test code because you don't know if the main code really does what you intended it to do, that you haven't made any errors or other mistakes. You also want your test code to protect you in future refactorings. So, how do you accomplish this ? Do you just write your test code, run it, and when it works say "OK, now I believe everything is perfect, now I'm done!" ? If so, what makes you sure ? Personally, I'm an atheist, I don't take anything on belief. To me if someone says "I now believe this is done!", I interpret it as "I really don't know if this is done, but I sincerely hope so". I also read into this, that people who express themselves like that, really doesn't know how to become sure. Well, you can never be really sure, but can reach a higher confidence level. 

Why can't you be sure ? This leads to my first question, "What is the difference between the main code being tested, and the test code ?". The answer is "_Nothing_"! They are both just code. They both have the purpose of providing functionality. So what makes the test code have higher quality than the code tested ? The answer is again "Nothing"! How do you know that you haven't made errors in the test code ? You don't! 

"Hey, this guy is pessimistic! Is he really saying tests are worthless ?" No, I'm not! Tests are not worthless, they are very useful and a good thing to have. But you have to accept that there are no plain main code and magic test code. 

This brings on the second question, "_How do you measure the quality of the test code ?_". The only way I have found is: over time. The more you change the main code without touching the test code, and the test code does its job, the more sure you can be about its quality. "But wait, I always have to modify and sometimes redo the test code when I make larger changes and refactorings!”, some people will say. If so, why is that ? Testing at too low levels maybe ? What I wan't to get out of my tests is to verify the main functionality, and I do that at public API levels. That is, places in the code that are least likely to change, and when they change the changes are usually minor. Thereby I can do a lot of stuff lower down, and if the test still tells me that I haven't broken anything, then I feel more and more confident over time that, it is true. Anytime I have to modify test code it goes down on the quality scale again.

"_Every single method must have a test!_" Ehh … NO! It does not, for quite obvious reasons. I've seen tests that test one line methods printing a log message! I've seen tests that does nothing else than verify that Java is capable of doing integer math ... A lot of people take test code coverage to mean just that you should have a test for every single method. They don't seem to consider that when you place the tests higher up, they still run and test the lower code. And if a code coverage tool tells you that there are untested code (code that did not get executed during the test), then you should ask yourself, is that code really used ? Have I covered all functionality variants ? Is my code too complex ? If you put a test on every single method, you will never get that feedback.