---
layout: post
title: "Ideal branching model specification"
date:   2016-05-14 16:03:20 +0000
tags:
  - development
  - git
  - workflow
  - branching model
permalink: /ideal-branching-model-specification.html
excerpt: "Explain what an ideal branching model / workflow should be"
tldr: "This article explain what a good branching model is"
---

Contributing to a project the right way is not always easy. We have to 
understand how the system works. We need to be sure we are allowed to
contribute and if we are, we also need to know how to contribute.

As a maintainer you want developers to be as less confused as possible.  
You don't want them to leave because it's too complicate to contribute, 
right ?

There is a kind of convention for open source projects. People tends to
act the same way in every open source projects. But I don't know why
people don't use the same conventions in companies. Instead they use
exotic or over-complicated branching model. 

In order for it to be the less confusing, branching model must be
**distinguishable**, **easy** to learn, **well known** by every
developers and **provide tools** to ease its use.

# Distinguishable
It should be clear to others which branching model is used by the 
project.  
If a developer wants to contribute and don't know that you are using a
specific branching model, he/she could be confuse or act if there were no
workflow.  
One way to avoid this is to create a `CONTRIBUTING.md` file in the root
directory of your project. Sadly, not many people think to look if such
a file exists. You may need to add a link in your `README.md` file as 
well.  
Some branching model does not use the master branch as the main branch.  
Hence, they are easier to recognize.

# Easy to learn
If you want people to contribute to your project, they should not be
annoyed with a very complicated to learn/understand workflow.  
Terms like feature, hot-fix, release has nothing to do with a version
control system. They add more complexity for new developers.  
So try to use the simplest branching model as possible.

#  Well known
The more your branching model is known by people, the easiest it is to 
integrate new developer in your project. There is already a bunch of
workflow defined. Pick one that already exists and used by a large
community and there is more chance that new developers know it.  
As always: **don't try to reinvent the well**.

#  Providing tools
If you found a branching model that is easy to learn, there should not 
be the need for a tool to use.  
Requiring a tool to make your branching model work is a very bad idea. 
Your users will need to install them, configure them. You will need to
provide a doc. This is too much noise for a developer to start
contributing.

But you may want to provide a tool to ease some repeating tasks. For 
example, if you need to execute 3 or 4 git command in order to merge 
your work in the master branch, then having a tool to replace those 
commands may be interesting.
Complex commands should not be require for developers to start
contributing. The couple `commit` and `push` should be sufficient.

I think that tools may be interesting when you want to merge some work 
to the master branch. In that stage, you may want to have a clean git
history, add something to the changelog and add some extra information.
Merging happen so far in the process that you won't make developer
withdraw their contribution. Chances are that you will be responsible 
of that action.

But sometimes tools are inevitable. They should be use for complex tasks
and not mandatory at least for the common task.  
For example, tools may be useful when you want to maintain a changelog
or have a clean version control history.

In a next post, I will describe the branching model I use which looks a
lot like the [GitHub flow](http://scottchacon.com/2011/08/31/github-flow.html) workflow.
