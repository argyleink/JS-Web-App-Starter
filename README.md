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

#### Result
- App is running at `1.3.3.7` in your browser
- API is running at `1.3.3.7/api` in your browser
- Visit the app from another device on the same wifi with `COMP_IP_ADDRESS:3030`
- All the goodness of vagrant
- All the goodness of grunt

#### Note
After you've run setup, subsequent app runs should be done with `vagrant up && grunt`  
Test the API at `1.3.3.7/api/user/dood`
