sudo su
apt-get update -y
apt-get install wget apache2 apache2-utils php5 libapache2-mod-php5 build-essential libgd2-xpm-dev unzip -y
service apache2 start
useradd nagios -p nagios123
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd www-data
cd /opt/
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.2.2.tar.gz
tar xzf nagios-4.2.2.tar.gz
cd nagios-4.2.2
./configure --with-command-group=nagcmd
make all
make install
make install-init
make install-config
make install-commandmode
/usr/bin/install -c -m 644 sample-config/httpd.conf /etc/apache2/sites-enabled/nagios.conf
ls -l /etc/apache2/sites-enabled/
service apache2 restart
htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin password123
a2enconf nagios
a2enmod cgi
service apache2 restart
cd /opt
wget https://www.nagios-plugins.org/download/nagios-plugins-2.1.2.tar.gz
tar xzf nagios-plugins-2.1.2.tar.gz
cd nagios-plugins-2.1.2
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
service nagios start
ln -s /etc/init.d/nagios /etc/rcS.d/S99nagios
