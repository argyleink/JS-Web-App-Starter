### Vagrant Powered Dev Environment
##### Back End:
- Nginx  
- Express  
- MySQL

##### Front End:
- JS  
- Jade  
- Stylus

### What's Inside?
- Automagic server
- Best static file server out there
- Node/Express API started for easy routing to DB
- Clean Grunt task architecture
- Dev and Prod builds (min and non-min static files)
- Autoreload
- Jade everywhere! Jade for static HTML generation and for client side templating
- Stylus with Nib
- Bower component management

## First Time Setup
#### Requirements
- [Vagrant](http://www.vagrantup.com/downloads.html)
- [Virtual Box](https://www.virtualbox.org/)
- Chef `gem install librarian-chef`
- [Node & NPM](http://nodejs.org/)
- Bower `sudo npm install -g bower`
- Grunt `sudo npm install -g grunt-cli`
- Internet, doi ;)

#### Steps
From the root folder of this repo, run `bash setup.sh`. You may be prompted for your password, for some globally installed items. 

This installs the node modules, bower components, jade template library, and runs the dev grunt task. Then this downloads the cookbooks we'll need to provision the server that vagrant is about to spin up. This will run for a few minutes, but when it's done, you'll have node and nginx up and running, ready for a rest based modern web app.

When setup is complete, your console should report a build success and show you the node api output. This means everything is working properly. So pop open a new console tab, and run `grunt`. This will compile all the assets for development, open a browser tab, and start watching for file changes. This is just like Yeoman, except, we're working against a VM instead of your local machine. The power is how easy this is to share with others =)

To setup auto-reload, open `app/includes/scripts.jade` and put your ip address into the space where mine is. Uncomment the line, save, run `grunt`. 

#### Result
- App is running at `1.3.3.7` in your browser
- API is running at `1.3.3.7/api` in your browser
- Visit the app from another device on the same wifi with `COMP_IP_ADDRESS:3030`
- All the goodness of vagrant
- All the goodness of grunt

#### Commands on your machine
- `grunt`: your goto build command
- `grunt dev`: a dev build without watching
- `grunt prod`: crunch it all
- `vagrant suspend`: put VM to sleep

#### Commands on virtual machine
> First you need to run `vagrant ssh` to run these commands  

- `node /var/api/app.js`: start the node api server
- `mysql -u root -p`: connect to mysql cli
- `sudo nginx -s reload`: restart Nginx

#### Note
After you've run setup, subsequent app runs should be done with `vagrant up && grunt`  
Test the API at `1.3.3.7/api/user/dood`
