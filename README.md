```
Roberto Nogueira  
BSd EE, MSd CE
Solution Integrator Experienced - Certified by Ericsson
```

# Rails Site Manager

![project image](images/project.png)

**About**

This is in order to help the working CLI daily activities. It shows the `rvm` current status, besides the further info about `projects` sessions.

**Advantages:**

* Development Flux and Environment seamlessly integrated.
* Live **rvm** and **projects** information.
* Supports for Mac.
* Object-Oriented bash style
* Supports [**fast ping**](https://fping.org).

See example of use below:

**Note:** When appears "username" type `enter` and when appears "Password:" type `shift insert`$ site

`site: robertonogueira@robertonogueira
  git domain gmail
  rvm domain ruby-2.7.5
projects:
  1 2022-05-29 job-justworks +job +rails @rails
  2 2022-05-30 tutorial-turbo-rails +rails +tutorial @rails
  3 2022-06-05 clockwork_web +project +rails @rails
  4 2022-06-05 rails-site-manager +rails @bash @rails`

![](images/screenshot1.png)

## Requirements and Tips

In order to install `Site Manager`, it is required that the following has been installed already:

* [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [project-today-manager](https://github.com/enogrob/project-today-manager)
* [project-tag-manager](https://github.com/enogrob/project-tag-manager)

**For further help:**

```shell
Crafted (c) 2021~22 by Encora - We are stronger together
Site v1.0.00

site [site    [help|encora|domain|print|projects]]
site [domain  [help|encora|gmail]]

site [projects  [help|ls|print]]
::
homepage https://github.com/enogrob/rails-site-manager
```

**Installation**

```shell
pushd /tmp
git clone git@github.com:enogrob/project-today-manager.git
source ./project-today-manager/today
mv project-today-manager ~/Projects
echo "test -f ~/Projects/project-today-manager/today && source ~/Projects/project-today-manager/today" >> ~/.bashrc
popd 

pushd ~/Projects
git clone git@github.com:enogrob/rails-site-manager.git
echo "test -f ~/Projects/rails-site-manager/site && source ~/Projects/rails-site-manager/site" >> ~/.bashrc
source ~/.bashrc
popd
```

**Configuration**

It is required that the initial values for `domains` are set in initialization section of the `site` script.

**Changes log**

* **1.0.01** First release.

**Refs:**

* **[How To Use Linux Screen](https://linuxize.com/tags/screen)** - Screen or GNU Screen is a terminal multiplexer, you can start a screen session and processes running will continue to run.
* **[fping](https://fping.org)** - Scriptable ping program for checking if multiple hosts are up..
