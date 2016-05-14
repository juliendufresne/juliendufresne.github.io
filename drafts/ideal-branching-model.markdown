---

layout: post
title: "Ideal branching model"
date:   2016-05-14 04:04:20 +0000
categories: git
excerpt: "Github flow"

---

Branching model is one of the first thing a developer has to know when
he/she wants to contribute to a project. It must be **distinguishable**,
**easy** to learn, **well known** by every developers and
**provide tools** to ease its use.

Distinguishable  
It should be clear to others that you are using this branching model and
not another.  
If a developer wants to contribute and don't know that you are using a
branching model, he could be confuse or act if there were no branching
model.  
One way to avoid this is to create a `CONTRIBUTE.md` file in the root
directory of your project. Sadly, not many people think to look if such
a file exists. You may need to add a link in your `README.md` file as 
well.  
You can also set your default branch to something else than master. This
way people who knows the workflow will directly understand.

Easy to learn  
If you want people to contribute to your project, they should not be
annoyed with something very complicated to learn/understand.  
Terms like feature, hot-fix, release has nothing to do with a version
control system and add more complexity for new developers.  
So use a branching model as simple as possible.

Well known  
The more your branching model is known by people, the easiest it is to 
integrate new developer in your project.

Providing tools  
It is one optional task. If you found a branching model that is easy to 
learn, there should not be the need for a tool to use.  
But sometimes tools are inevitable. They should be use for complex tasks
and not mandatory at least for the common task.  
For example, tools may be useful when you want to maintain a changelog
or have a clean version control history.

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

