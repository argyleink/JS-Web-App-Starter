echo -e "\033[1;32mSTATUS:\033[m Post provisioning started, this sets up Nginx, MySQL, and Node custom servers"

echo -e "\033[1;32mSTATUS:\033[m Flushing MySQL DB priveleges"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES;"

echo -e "\033[1;32mSTATUS:\033[m Building MySQL DB and planting seed data if needed"
USER=root
PASSWORD=password
RESULT=`mysql -u $USER -p$PASSWORD --skip-column-names -e "SHOW DATABASES LIKE 'app'"`
if [ "$RESULT" = "app" ]; then
  echo -e "\033[1;32mSTATUS:\033[m Database for this app already exists, skipping seed data import"
else
  echo -e "\033[1;32mSTATUS:\033[m Creating database 'app'"
  mysql -u $USER -p$PASSWORD < /var/db/create.sql
  mysql -u $USER -p$PASSWORD app < /var/db/seed.sql
fi

echo -e "\033[1;32mSTATUS:\033[m Setting up custom Nginx server..."
sudo cp /var/server/app.conf /etc/nginx/sites-available/app
sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
sudo nginx -s reload

echo -e "\033[1;32mSTATUS:\033[m Setting up custom Node server..."
cd /var/api/ 
npm install

echo -e "\033[1;32m!** BUILD SUCCESS **!\033[m Running Nodejs API server..."
node app.js