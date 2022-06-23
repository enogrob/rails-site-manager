```
Roberto Nogueira  
BSd EE, MSd CE
Solution Integrator Experienced - Certified by Ericsson
```

# Rails Site Manager

![project image](images/project.png)

**About**

This is in order to help the working CLI(Object Oriented Bash style) daily activities. It shows live relevant rails project information in the cli such as `rvm`, `env`, `db` and `git` domains, `services` and `databases` information.

**Advantages:**

* Development Flux and Environment seamlessly integrated.
* Live `rvm`, `env`, `db` and `git` domains, `services` and `databases` information.
* Support local and remote databases setups, remote import and download databases.
* Support start/stop services at once with consolidated logs.
* Better db consoles for `mysql`, `postgresql` and `redis`.

**Dependences:**

* Packages: [ack](https://beyondgrep.com), [ansi](https://github.com/fidian/ansi),[cowsay](https://github.com/tnalpgge/rank-amateur-cowsay), [fping](https://fping.org), [iredis](https://iredis.io), [mycli](https://www.mycli.net), [pgcli](https://www.pgcli.com), [pv](http://www.ivarch.com/programs/pv.shtml) and [wget](https://ftp.gnu.org/old-gnu/Manuals/wget-1.8.1/html_mono/wget.html).
* Gem: [foreman](https://github.com/ddollar/foreman).

Se References below for further info.

![](images/screenshot1.png)

**Example of uses:**

Here it is shown possible CLI commands(relevant ones) according to the previous picture following CLI styles e.g. OO and usual bash which can be used interchangeably.


```shell
$ site.methods
methods|help|init|name|print|version

$ vpn.methods
methods|help|init|connected|loop|print

$ rvm.domain.methods
methods|help|init|development|print|test

$ env.domain.methods
methods|help|init|development|print|test

$ dbs.domain.methods
methods|help|init|local|multi|print|remote

$ git.domain.methods
methods|help|init|justworks.init|justworks|gmail.init|gmail|print
:
$ services.methods
methods|help|init|start|stop|print

$ services.mysql.methods
methods|help|init|console|list|restart|start|stop

$ services.redis.methods
methods|help|init|console|list|restart|start|stop

$ dbs.methods
methods|help|init|console|current|download|import|dumps|create|refresh|delete|rebuild_test|print
```

Here it is show a Download/Import a remote `DB` from `Skylab`, setting up the use of the remote DB and a connection to the underlying `DB` by using `mycli` console.

**Note:** In order to Download the remote DB or even accessing it the `AWS VPN Client` has to be connected. 

```shell
$ site env.domain development
$ site git.domain gmail

$ site vpn connected
yes

$ site dbs download
==> Downloading  clockwork_sanitized_no_excluded_tables.sql.gz
100%[============..==========>]  18.46G  4.62MB/s    in 62m 51

$ site dbs.domain local
$ site dbs import 
==> Dropping  databases
==> Creating  databases
==> Importing  clockwork_sanitized_no_excluded_tables.sql.gz
19.2GiB 6:31:39 [ 858KiB/s] [============..===========] 100%

$ site dbs rebuild_test
==> Running rebuild_test.sh
==> Running dbs.init

$ site dbs.domain remote
$ site dbs console
:
Connecting to socket /tmp/mysql.sock, owned by user robertonogueira
MySQL
mycli 1.25.0
Home: http://mycli.net
Bug tracker: https://github.com/dbcli/mycli/issues
Thanks to the contributor - Klaus Wünschel
MySQL root@(none):clockwork_dev> exit
:

$ site services start 
:
1:05:47 web.1    | started with pid 60027
01:05:47 worker.1 | started with pid 60028
01:05:47 assets.1 | started with pid 60029
01:05:47 assets.1 | yarn run v1.22.19
:

# from another terminal
$ site
:
$ site services stop 
:
```

**For further help:**

```shell
$ site --help
Crafted (c) 2021~22 by Encora - We are stronger together
Site v1.0.07

site    [print|version]
vpn    [connected|loop|print]
::
rvm.domain    [print]
env.domain    [print|development|test]
dbs.domain    [print|local|remote|multi]
git.domain    [print|justworks|gmail]
::
dbs    [print|download|import|dumps|create|refresh|delete|rebuild_test]
services    [print|start|stop]
services.mysql    [console|list|restart|start|stop]
services.redis    [console|list|restart|start|stop]
::
homepage https://github.com/enogrob/rails-site-manager
```

**Installation:**

```shell
# install site and its deps
pushd /tmp
mkdir -p ~/Projects
git clone git@github.com:enogrob/rails-site-manager.git
cd rails-site-manager
brew bundle --no-upgrade
cd ..
curl -OL git.io/ansi
chmod 755 ansi
sudo mv ansi /usr/local/bin/
mv rails-site-manager ~/Projects
popd

# install foreman gem
pushd ~/Projects/clockwork_web
gem install foreman --no-document
popd
```

**Configuration**

It is required that the some initial values are set in initialization section of the `site` script e.g. `site.init`. e.g.
```shell
:
site.init(){
  unset fnames
  :
  git.domain.justworks.init "Roberto Nogueira" "rnogueira@justworks.com"
  git.domain.gmail.init "Roberto Nogueira" "enogrob@gmail.com" 
  :
}
:
```

Also add the source of the `Rails Site Manager` and the `Puppet Credentials` in the `~/.bashrc` .
```shell
:
# rails site manager
export PUPPET_USER=<user login>
export PEPPET_PASS=<password>
test -f  "$HOME/Projects/rails-site-manager/site" && source "$HOME/Projects/rails-site-manager/site"
:
```

Also the `database.yml.remote`, `database.yml.multi` and `database.yml.local` have to be placed in `config` directory in Rails project directory tree e.g. `clockwork_web`.

**Note:** The files `database.yml.remote` and `database.yml.multi` are downloaded from the `sanitized DB` email.

```shell
pushd ~/Projects/clockwork_web
cp config/database.yml config/database.yml.local
mv ~/Downloads/database.yml.remote config/
mv ~/Downloads/database.yml.multi config/
popd
```

Once all that is performed just source the `~/.bashrc`, and one is ready to go!
```shell
source ~/.bashrc
```

**Note:** This underlying project is still under development so mind __to keep its local repo updated__.

```shell
pushd ~/Projects/rails-site-manager
git pull
popd
```

or just

```shell
site update
```

**Changes log**

* **1.0.07** Add method `rebuild_test` to `dbs`.
* **1.0.06** Refactor `git.domain` and add methods `create|refresh|delete` to `dbs`.
* **1.0.05** Add `vpn` namespace.
* **1.0.04** Refactor `dbs.import`.
* **1.0.03** Refactor `dbs.domain` as a really namespace.
* **1.0.02** Improve `dbs.domain.print` and corrected `dbs.init`.
* **1.0.01** Implement methods `console|list|restart|start|stop` for  `services.msql` and `services.redis`.
* **1.0.00** First release.

**Refs:**

Based on: [research-obras-devtools](https://github.com/enogrob/research-obras-devtools) - Obras Development process, development utilities and support for Foreman, Docker and editors VsCode and Rubymine.

* [ack](https://beyondgrep.com) - grep-like source code search tool.
* [ansi](https://github.com/fidian/ansi) - Escape codes in pure bash.
* [cowsay](https://github.com/tnalpgge/rank-amateur-cowsay) - Configurable talking characters in ASCII art.
* [foreman](https://github.com/ddollar/foreman) - Manage Procfile-based applications.
* [fping](https://fping.org) - Scriptable ping program for checking if multiple hosts are up.
* [iredis](https://iredis.io) - A Terminal Client for Redis with AutoCompletion and Syntax Highligting.
* [mycli](https://www.mycli.net) - A Terminal Client for Mysql with AutoCompletion and Syntax Highligting.
* [pgcli](https://www.pgcli.com/) - A Terminal Client for Postgresql with AutoCompletion and Syntax Highligting.
* [pv](http://www.ivarch.com/programs/pv.shtml) - Pipe Viewer.
* [wget](https://ftp.gnu.org/old-gnu/Manuals/wget-1.8.1/html_mono/wget.html) - The noninteractive downloading utility.
