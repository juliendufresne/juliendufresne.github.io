---

layout: post
title: "Git workflow"
date:   2016-05-14 04:04:20 +0000
categories: git
excerpt: "Github flow"

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






I like the fact that the master branch must be deployable at any time. 
But what it means is that this branch must always be in a stable state 
and that, some people don't understand that.  
In fact, when we are working on an open source project, there is no 
problem. You have maintainers responsible
So when developers don't understand this, I use to 

When you initialize your git project, it usually creates a branch named
`master`.  
It is obvious for any developer that this branch is the main one. What's
not obvious is that this branch should always be stable enough to be
used in production.  
In the companies for which I worked, it was never obvious for everybody
that the `master` branch must always be stable. So sometimes I rename it
`stable`. This way nobody tends to put unterminated code in it.  
I stick with the master branch for open source software because
 everybody is using this flow in the open source world.
 
This branch is the only mandatory branch

## Use pull requests to add something to stable branch

Versioning control platform such as [GitHub](httpd://github.com/),
[GitLab](https://about.gitlab.com/) or [Bitbucket](https://bitbucket.org/)
provides some useful functionality on top of git.  
One of which is the Pull Requests also called Merge Requests.  
Some of the main advantages of pull requests over simple merge are:
- You can compare your development against the stable branch
- People can put comments on specific changes
- you can separate the reviewer role from the developer role
- you can add some labels to describe what you are trying to achieve.
Is it a bug fix, a BC Break functionality or a simple feature
- you can link your pull request to your bug tracking and interact with
it.

## One Pull Request = One feature/bug-fix



## Use [semver](http://semver.org/) tag for your version history 

It's obvious for many of you but not for everybody.  
So each time you deploy your code to production (for application) or you release a new version (for library), you need to use semantic versioning.  
Tag helps you to reference a specific state (commit) of your history.

