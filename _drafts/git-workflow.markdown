---

layout: post
title: "Git workflow"
date:   2016-05-14 04:04:20 +0000
categories: git
excerpt: "Github flow"

---

# A well known workflow: The [GitHub flow](http://scottchacon.com/2011/08/31/github-flow.html)

Since one of the criteria defined above is that the branching model must
be known for a lot of developers,
I can only think of one workflow that met all requirements: the GitHub
flow.

It is the flow you will see in most open source projects and I don't
know why I haven't seen it so often in companies.  
This flow is so obvious to me that I have used it for many years without
even knowing it has a name.  
Let me review it more in depth.

## One stable branch

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

