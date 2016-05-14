---
layout: post
title: "Git workflow"
date:   2016-05-15 01:49:42 +0000
tags:
  - development
  - git
  - workflow
  - branching-model
permalink: /git-workflow.html
excerpt: "Github flow"
summary: "The workflow I use every time I can"

---

In a previous article, I explained what makes a branching model good. 
Now I will present my own. It looks a lot like the [GitHub flow](http://scottchacon.com/2011/08/31/github-flow.html) 
but with some extra rules.

# The Basic: [GitHub flow](http://scottchacon.com/2011/08/31/github-flow.html)

Since one of the criteria to choose a good workflow is to use a very
well known one, I couldn't tell you that I'm using a totally exotic one.

It seems that I used the Github flow without even knowing it has a name.  
If you don't know the branching model yet, I will give you some key
principles:

- The master branch is deployable at any time
- New features and fixes are created from master
- Use pull request
- Merge pull request to master after review

# Some additions

The GitHub flow is very well designed but I like to add some extra.

## One feature/fix per branch

First, I must insist on the fact that a branch _MUST_ contain only one 
feature. Too often I see a branch that contain a feature and some 
global refactoring. I used to do it myself and each time I regret it.

Suppose you start a new feature and discover a bug in the current
version of the master branch. You want to fix it on your branch. What 
could happen ?
- Your feature is not ready yet so you can not ask for a merge. The bug
 is not fixed as long as your feature is not developed
- Once the maintainer merge your branch into master, you discover a bug 
 in production. What is the reason of the bug ? Is it the new feature ? 
 The bug fix ? We don't know and need to investigate. This may mean we 
 have to rollback to an older version but it is not always easy to
 rollback (database dependencies, other dependencies, ...)
- Suppose you are using semver (you should). What should be the new
 tag version ? Probably X.(Y+1).Z or (X+1).Y.Z but we don't know we have
 fixed a bug. And if you are working on a library, user may not benefit
 from your fix because there requirements does not fit the new versions.
- How can we manage automatically a changelog if more than one thing
 lived inside a branch ?

## Define some maintainers

Maintainers are ones responsible for merging pull request to the master 
branch.

One thing that I like with open source projects is that you have some
clearly defined some maintainers. If you are a contributor, you may not
know them but at least you know you are not one of them. This means that
as a developer, you know you are only responsible for feature/fix
**proposal**.

In other term, developers have to know some basic commands:
- `git clone <repo_url>` to get the code
- `git checkout -b <branch_name>` to create the branch `branch_name`
- `git add <some_files>` and `git commit` to modify the source code
- `git push -u origin <branch_name>` to propose a change to the code
base

It is basically it. It's very easy for a developer to get started, don't
you think ?

Separating maintainers from developers allows you to require more 
advanced command when it comes to merge a Pull Request

## Keep your history clean

This part is the more controversial and you may think I'm completely 
crazy but I would really like to discuss about this so please comment.
 
I like to keep my git history as clean as possible.  
Developers may want to split their work into multiple commit message and
this is a very good thing when the feature/fix is not ready.

But when both developers and maintainers agreed that the branch is 
ready for production, I want to have only one commit referencing this 
feature.

Let's be clear. I'm not talking about long living branch and very
massive feature containing thousands of lines. This should be avoided at
all cost. Branches should have a very short life time.

So when it comes to merge the pull request, I squash everything to a
single commit, rewording the first commit message if necessary and click
the "Squash and merge" button in GitHub. The latter thing will append
the pull request reference to the commit message for a quick access.

## Short living branches

There is nothing more frustrating than having to resolve conflicts.  
Resolving conflict means there is some code _you don't know_ that
changed between the time you get the code and the time you edited it.

Since you don't know what the purpose of the new code, you basically 
don't know how to resolve the conflict. You need help from the one 
who committed the new code. But he or she doesn't know your code either.
So You need to both explain what your part of the code is doing.

In short, it's shitty as hell.

We need to ensure there is as less conflict as possible. One way to 
avoid conflict (both physically and in your vcs) you need to merge 
often. So branches should not live too long.

Defining _too long_ is not easy because it depends on the repository 
activity. The more active a repository is the shorter a branch should
live because the more frequent conflict will be.

For example, in a company, I use to limit the branch life to 2 days. 
The reason for that is that if the feature requires more than 2 days to
be developed, it probably means that we did not delimit the scope of the
feature well enough. The more time a feature requires the wrongest the
estimation will be.
If a feature cost less than 2 days it could lead to two things:
- the feature is released in time. Everything is good.
- the feature is not released and the developer can give a new
estimation of the work remaining. With that in mind, the manager can
choose to cancel the feature or not.

Now imagine the second scenario, if the task is estimated to one month.
The manager can't decide to cancel the feature because it already cost a
lot.

So branches should have a very short lifetime for both managers and 
developers sake.

## Use [semver](http://semver.org/) tag for your version history

More and more developers know semver and that's a relief !

Each time you deploy your application, you should create a tag following
semantic versioning MAJOR.MINOR.PATCH:
- MAJOR is for backward incompatible changes
- MINOR is for new feature backward compatible
- PATCH is for bug fix that don't break backward compatibility.

Since the master branch should always be deployable, it means every time
you merge a pull request, you can create a new tag. It looks like we 
need an automation here.
In order to help you define the new tag, you should think of adding a 
label to the pull request:
- `bug` for a bug-fix (update PATCH version)
- `enhancement` for a backward compatible new feature (update MINOR
version)
- `BC break feature` for a non backward compatible new feature (update
MAJOR version)

_Note 1: I don't talk about alpha, beta and RC tags because I found
those overcomplicated. They should be used when big features are merge
but as said before, that should never be the case_

## Maintain a changelog

Maintaining a changelog can be such a pain.

In our case, the changelog is very easy: it corresponds to our commit 
history !  
If you remember what I wrote a few line above, when I merge a pull
request, I squash everything from the branch in order to have only one
commit for the branch with the link to the pull request.  

Yes, that's cool. But commit history does not tell us which commit
corresponds to which tag. We need a `CHANGELOG.md` file.  
But hey, [some tools](https://github.com/skywinder/github-changelog-generator#output-example) already exists. Use it.

You should also think about automating this.

## Special case: Maintaining a Library

When you maintain a library project, you probably needs to maintain 
several branch. One for each MAJOR.MINOR version you want to maintain.  
Let's take an example. Suppose we are maintaining the following versions:
- 2.3.*
- 2.7.*
- 3.0.*
Then We should have one **stable** branch for each:
- 2.3
- 2.7
- master

Now, when we add a new feature, it should be merged in the master branch
only.  
But what if we fix a bug ? Chances are that the maintainer needs to
merge it to multiple branches. The maintainer can try to cherry pick the
fix to all branches but he/she will probably needs the help of the 
developer. In such a case, creating multiple pull request may be the
easiest solution.

The cherry pick option is not easy to automate. We can [build a CI Server](https://developer.github.com/guides/building-a-ci-server/)
that will try to do the cherry pick in a local clone. But if it fails, 
the maintainer should ask the developer to create one branch per
maintained version of the library.
