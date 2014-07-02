echo -e "\033[1;32m STATUS: Installing NPM Modules \033[m"
npm install
sudo npm install -g clientjade
echo -e "\033[1;32m STATUS: Installing Bower Components \033[m"
bower install
echo -e "\033[1;32m STATUS: Grunt first run \033[m"
grunt dev
echo -e "\033[1;32m STATUS: Installing chef libs \033[m"
librarian-chef install
echo -e "\033[1;32m STATUS: Vagrant started, will be 2-5 minutes \033[m"
vagrant up
echo -e "\033[1;32m STATUS: Server ready, running grunt with watch \033[m"
grunt