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

* Packages: [ansi](https://github.com/fidian/ansi), [iredis](https://iredis.io), [mycli](https://www.mycli.net), [pgcli](https://www.pgcli.com), [pv](http://www.ivarch.com/programs/pv.shtml) and [wget](https://ftp.gnu.org/old-gnu/Manuals/wget-1.8.1/html_mono/wget.html).
* Gem: [foreman](https://github.com/ddollar/foreman).

Se References below for further info.

See example of use below:
Here it is show a Download/Import a remote DB from `Skylab` and then setting up the use of the remote DB.

**Note:** In order to Download the remote DB or even accessing it the `AWS VPN Client` has to be connected.

```
$ env.domain.methods
methods|help|init|development|print|test
$ git.domain.methods
methods|help|init|encora.init|encora|gmail.init|gmail|print
:
$ env.domain development
$ git.domain gmail

$ dbs.methods
methods|help|init|parse_yml|console|current|has_database|tables|has_tables|records|has_records|print_db|print|location|domain|domain.print|download|import|dumps
:
$ dbs.download
==> Downloading  clockwork_sanitized_no_excluded_tables.sql.gz
nloads/clockwork_sa   0%[                   ]  42.40M  4.70MB/s
$ dbs.import
==> Importing  clockwork_sanitized_no_excluded_tables.sql.gz
$ dbs.domain remote

$ dbs.console
:
Connecting to socket /tmp/mysql.sock, owned by user robertonogueira
MySQL
mycli 1.25.0
Home: http://mycli.net
Bug tracker: https://github.com/dbcli/mycli/issues
Thanks to the contributor - Klaus Wünschel
MySQL root@(none):clockwork_dev> exit
:

$ services.start or site services start
:
1:05:47 web.1    | started with pid 60027
01:05:47 worker.1 | started with pid 60028
01:05:47 assets.1 | started with pid 60029
01:05:47 assets.1 | yarn run v1.22.19
:
$ site
:
$ site services stop
:
```

![](images/screenshot1.png)


**For further help:**

```shell
Crafted (c) 2021~22 by Encora - We are stronger together
Site v1.0.00

site    [print|version]
::
rvm.domain    [print]
env.domain    [print|development|test]
dbs.domain    [print|local|remote|multi]
git.domain    [print|encora|gmail]
::
dbs    [print|download|import|dumps]
services    [print|start|stop]
::
homepage https://github.com/enogrob/rails-site-manager
```

**Installation:**

```
pushd /tmp
# install site
mkdir -p ~/Projects
git clone git@github.com:enogrob/rails-site-manager.git
mv rails-site-manager ~/Projects

# install site deps
curl -OL git.io/ansi
chmod 755 ansi
sudo mv ansi /usr/local/bin/
brew bundle Brewfile
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
  git.domain.encora.init "Roberto Nogueira" "roberto.nogueira@encora.com"
  git.domain.gmail.init "Roberto Nogueira" "enogrob@gmail.com" 
  projects.init false
  :
}
:
```

Also add the source of the `Rails Site Manager` and the `Puppet Credentials` in the `~/.bashrc` .
```
:
# rails site manager
export PUPPET_USER=<user login>
export PEPPET_PASS=<password>
test -f  "$HOME/Projects/rails-site-manager/site" && source "$HOME/Projects/rails-site-manager/site"
:
```

Also the `database.yml.remote`, `database.yml.multi` and `database.yml.local` have to be placed in `config` directory in Rails project directory tree e.g. `clockwork_web`.
```
pushd ~/Projects/clockwork_web
cp config/database.yml config/database.yml.local
cp ~/Downloads/database.yml.remote config/
cp ~/Downloads/database.yml.multi config/
popd
```

Once all that is performed just source the `~/.bashrc`.
```
source ~/.bashrc
```

**Changes log**

* **1.0.01** First release.

**Refs:**

* [ansi](https://github.com/fidian/ansi) - Escape codes in pure bash.
* [foreman](https://github.com/ddollar/foreman) - Manage Procfile-based applications.
* [iredis](https://iredis.io) - A Terminal Client for Redis with AutoCompletion and Syntax Highligting.
* [mycli](https://www.mycli.net) - A Terminal Client for Mysql with AutoCompletion and Syntax Highligting.
* [pgcli](https://www.pgcli.com/) - A Terminal Client for Postgresql with AutoCompletion and Syntax Highligting.
* [pv](http://www.ivarch.com/programs/pv.shtml) - Pipe Viewer.
* [wget](https://ftp.gnu.org/old-gnu/Manuals/wget-1.8.1/html_mono/wget.html) - The noninteractive downloading utility.
