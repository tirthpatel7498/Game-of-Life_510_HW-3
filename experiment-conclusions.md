# Experiment Conclusions

Our data and visualizations can be seen at this [Google Sheet](https://docs.google.com/spreadsheets/d/1kz9Hj8m2nxQ8EtbHXal9YjH7S8xjFteBVq4-f7mumaY/edit?usp=sharing). Some visualizations and summaries are provided inline below.

## Methods

We studied 10 different participants across three different programming languages (Lua, Dart, and golang). Each particpant had 30 minutes to find bugs in a single implementation. We assigned each particpant a language to code in and observered their progress via Zoom screen sessions. In some cases we gave general hints, but stayed away from explicity mentioning where they were in the code. 

While we initially were expecting our participants to download our repository, we turned to [repl.it](https://repl.it) as our first experiments consumed too much time to download and setup their development environment.

## Materials

We utilized a [script](../script-to-guide-the-session.md) to guide our experiemtn. We followed this script for each participant. 

We utilized a [Google form](https://docs.google.com/forms/d/e/1FAIpQLSfKlXzNkoM31rRwZGDyyQHUqQ2LaqsOaHLS6QvlwOjfFOeHuQ/viewform) for capturing user feedback. The following responses were taken:
* Token Number?
* Language Worked on? 
 
  `golang`, `lua`, or `dart`

* On a scale of 1-5, how confident are you that you have fixed the bug, with 1 being the least confident and 5 being the most confident?"
* On a scale of 1-5, how easy do you find this language, with 1 being the easiest and 5 being the hardest?
* On a scale of 1-5, The easiness to understand the description and documentation of files with 1 being the easiest and 5 being the hardest?
* How long did it take you to fix the bug?
* Other Comments(text box for comments outside the above questions.)

We also shared a Google Doc with each experimenters observations from the Zoom screen sharing session. We used this to note any common difficulties that would not be captured by our form.

## Observations


## Conclusions


## Threats to Validity

Our threats to validity can be summarized in a few key points

* We did not ask for a pre-experiment survey to assert the participants experience with any or our langugages.

This could lead to participants saying they had not used a language, but in fact had. This would skew our results.

* We did not time the bugs very precisely. 

We relied on user feedback and our observations to identify that amount of time taken. This could also skew our results in the form of either bias, or simply forgetfullness. 

* Our sample size is small.

10 participants is very small for an experiment to draw meaningful conclusions from. 

## Learnings

We had a handful of learnings from conducting this experiment

- **Use Tests to Help Participants Know They Have Fixed a Bug**

  Our participants had a hard time knowing if they had solved the bug. While we had tests in our repository, we should have written negative tests cases that were intentionally failing in a hosted coding environment like [repl.it](https://repl.it). This would have made it easier for participants to find logical errors in our implemenations. 

- **Start With a Hosted Coding Environment Like [repl.it](https://repl.it) First**

  If we would have used [repl.it](https://repl.it) to begin with, we could have made links to them, managing the bugs within them, etc. easier to manage.

- **Use Different Types of Bugs**

  We used only logical bugs instead of compilation bugs, mainly because we wanted our participants to use our repository. Something like [repl.it](https://repl.it) would have made this easier.

