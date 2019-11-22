# Installing Rails stack on Ubuntu 18.04 (Should work also on 16.04)

Rails framework and Ruby can be installed on Windows too
but if you want to install it on Windows - I would highly recommend to install it using Ubuntu subsystem
[How to install ubuntu subsystem on Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10) 
NOT The native installer because the a lot of scripts uses bash and for windows native installer there are plenty of workarounds to make things work. 


## Installing Rails stack on Ubuntu

The quickest way of installing Ruby on Rails with RVM (Ruby Version Manager) is to run the following commands.

We first need to update GPG, (GNU Privacy Guard), to the most recent version in order to contact a public key server and request a key associated with the given ID.

 `sudo apt install gnupg2`

 We are using a user with sudo privileges to update here, but the rest of the commands can be done by a regular user.

Now, we’ll be requesting the RVM project’s key to sign each RVM release. Having the RVM project’s public key allows us to verify the legitimacy of the RVM release we will be downloading, which is signed with the matching private key.

`gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

Let’s now move into a writable location such as the /tmp directory and then download the RVM script into a file:

`cd /tmp`

We’ll use the curl command to download the RVM installation script from the project’s website. The backslash that leads the command ensures that we are using the regular curl command and not any altered, aliased version.

We will append the -s flag to indicate that the utility should operate in silent mode along with the -S flag to override some of this to allow curl to output errors if it fails. The -L flag tells the utility to follow redirects, and finally the -o flag indicates to write output to a file instead of standard output.

Putting all of these elements together, our full command will look like this:

`curl -sSL https://get.rvm.io -o rvm.sh`

Once it is downloaded, if you would like to audit the contents of the script before applying it, run:

`less /tmp/rvm.sh`

Then we can pipe it to bash to install the latest stable Rails version which will also pull in the associated latest stable release of Ruby.

`cat /tmp/rvm.sh | bash -s stable --rails`

During the installation process, you may be prompted for your regular user’s password. When the installation is complete, source the RVM scripts from the directory they were installed, which will typically be in your home/username directory.

`source /home/your_user/.rvm/scripts/rvm`

For this app we need to install specific version of Ruby - rather than just the most recent one, we can do so with RVM. 
First, check to see which versions of Ruby are available by listing them:

`rvm list known`

Then, install the specific version of Ruby that you need through RVM, where ruby_version can be typed as ruby-2.4.0, for instance, or just 2.4.0:

`rvm install ruby_version`

Since in our case we are using ruby 2.6.3 
We'll do it like that: 

`rvm install ruby-2.6.3`

We can switch between the Ruby versions by typing:

`rvm use ruby_version`

Since Rails is a gem (ruby dependency - equivalent of pip for python), 
we can also install various versions of Rails by using the gem command. 
Let’s first list the valid versions of Rails by doing a search:

gem search '^rails$' --all
Next, we can install our required version of Rails. Note that `rails_version` will only refer to the version number, as in 5.2.0.

`gem install rails -v rails_version`

For our project we need rails version 5.2.0

## Install Javascript Runtime

Install JavaScript Runtime
A few Rails features, such as the Asset Pipeline (serving javascript/images/stylesheets (css)),

depend on a JavaScript Runtime. We will install Node.js with the package manager apt to provide this functionality.

Like we did with the RVM script, we can move to a writable directory, verify the Node.js script by outputting it to a file, then read it with less:

 
`cd /tmp`


`\curl -sSL https://deb.nodesource.com/setup_10.x -o nodejs.sh`


`less nodejs.sh`



Once we are satisfied with the Node.js script, we can install the NodeSource Node.js v10.x repo:

`cat /tmp/nodejs.sh | sudo -E bash -`


The -E flag used here will preserve the user’s existing environment variables.

Now we can update apt and use it to install Node.js:

`sudo apt update`


`sudo apt install -y nodejs`



## Setting up the PostgreSQL Database for Rails Development

In this step, we will prepare PostgreSQL for rails development. Ruby on Rails supports many databases such as MySQL, SQLite (Default) and PostgreSQL. We will use PostgreSQL as the database for this guide.

Install PostgreSQL and some other required packages with the apt command:

`apt-get -y install postgresql postgresql-contrib libpq-dev`


When the installation is done, login to the postgres user and access the postgresql shell.

`su - postgres`


`psql`


Give the postgres user a new password with command below:

`\password postgres`


`Enter new password:`


`Next, create a new role named 'seq' for the rails app with the command below:

`create user seq with createdb login password 'seq';`


Set a new password for the user and check that the user has been created.

Now check the new role and you will see new role has been created:

`\du`


The PostgreSQL database

You quit PostgreSQL shell by typing `\q`

## Cloning Repository to your local box.

Having all the dependencies in place you only need to clone the github repository with source using the command below:

`git clone https://github.com/ulversson/sequences-backend`




