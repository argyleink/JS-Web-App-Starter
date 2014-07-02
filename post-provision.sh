echo -e "\033[1;32m STATUS: Post provisioning started \033[m"
echo -e "\033[1;32m STATUS: Copying Nginx server file \033[m"
sudo cp /var/server/app.conf /etc/nginx/sites-available/app
sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
sudo nginx -s reload
echo -e "\033[1;32m STATUS: Nginx done, starting Node server \033[m"
node /var/api/app.js