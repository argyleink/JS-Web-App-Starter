echo -e "\033[1;32m STATUS: Post provisioning started, this sets up Nginx, MySQL, and Node custom servers \033[m"

echo -e "\033[1;32m STATUS: Flushing MySQL DB priveleges \033[m"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -ppassword
source /var/seed.sql
exit

echo -e "\033[1;32m STATUS: Setting up custom Nginx server... \033[m"
sudo cp /var/server/app.conf /etc/nginx/sites-available/app
sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
sudo nginx -s reload

echo -e "\033[1;32m STATUS: Setting up custom Node server... \033[m"
cd /var/api/ 
npm install
node app.js