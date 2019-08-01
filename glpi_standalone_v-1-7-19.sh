cd /
clear
echo
echo
echo 
echo Installing GPLI v 9.4.3 _01 July 19_ 
echo
echo Recommended OS : debian-10.0.0-amd64.
echo
echo
echo
sleep 5s

apt-get install -y sudo 
clear
echo Last change : sudo...
sleep 1s 

sudo apt-get update && apt-get upgrade 
clear
echo Last change : update and upgrade...
sleep 1s

sudo apt-get install -y aptitude
clear
echo Last change : aptitude...
sleep 1s

sudo aptitude install -y apache2
sudo systemctl enable apache2.service
echo "ServerName gestparc" > /etc/apache2/conf-available/fqdn.conf
sudo a2enconf fqdn
sudo systemctl reload apache2
/etc/init.d/apache2 reload
clear
echo Last change : apache2...
sleep 1s

sudo aptitude install -y php7.3 php7.3-mysql php7.3-gd
sudo apt-get install -y php-soap php-mbstring php-gettext php-curl php-ldap php-imap php-apcu php-xmlrpc php-cas php-mysqli php-mbstring php-gd php-simplexml php-xml
/etc/init.d/apache2 restart
clear
echo Last change : php...
sleep 1s

sudo aptitude install -y mariadb-server
systemctl enable mariadb.service
echo "CREATE DATABASE glpi" | mysql -u root 
echo "CREATE USER 'glpibdd'@'localhost' IDENTIFIED BY 'glpibddpass';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON glpi. * TO 'glpibdd'@'localhost';" | mysql -u root
clear
echo Last change : mariadb server and sql entries...
sleep 1s

cd /tmp
wget sewesty.com/glpi/glpi-9.4.3.tgz
tar xzf glpi-9.4.3.tgz
cp -R /tmp/glpi /usr/share
chown -R root.www-data /usr/share/glpi
chmod -R 775 /usr/share/glpi
ln -s /usr/share/glpi /var/www/html/
/etc/init.d/apache2 restart
clear
echo Last change : glpi...
sleep 1s

cd /
clear
echo
echo
echo 
echo GLPI 9.4.3 is installed. 
echo
echo github.com/periwinkleispurple/
echo
echo
echo
sleep 5s