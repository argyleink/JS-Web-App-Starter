echo -e "\033[1;32mSTATUS:\033[m Installing NPM Modules"
npm install
sudo npm install -g clientjade

echo -e "\033[1;32mSTATUS:\033[m Installing Bower Components"
bower install

echo -e "\033[1;32mSTATUS:\033[m Grunt first run"
grunt dev

echo -e "\033[1;32mSTATUS:\033[m Installing chef libs, can take a bit to kick in"
librarian-chef install

echo -e "\033[1;32mSTATUS:\033[m Vagrant up started, will be 2-5 minutes depending if you have the vm cached"
vagrant up