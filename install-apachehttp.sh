#sudo su
apt-get update -y 
apt-get install gcc -y
apt-get install make -y
apt-get install build-essential -y
apt-get install libssl-dev -y
cd /opt
curl -O http://mirror.metrocast.net/apache/httpd/httpd-2.4.23.tar.gz
tar xvfz httpd-2.4.23.tar.gz
cd /opt/httpd-2.4.23/srclib/
wget http://apache.mirrors.ionfish.org/apr/apr-1.5.2.tar.gz
tar xvfz apr-1.5.2.tar.gz
mv apr-1.5.2 apr
cd apr
./configure
make
make install
cd /opt/httpd-2.4.23/srclib/
wget http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.bz2
tar xvfj apr-util-1.5.4.tar.bz2
mv apr-util-1.5.4 apr-util
cd apr-util
./configure --with-apr=/opt/httpd-2.4.23/srclib/apr
make
make install 
cd /opt/httpd-2.4.23/srclib/
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz
tar -zxf pcre-8.39.tar.gz
mv pcre-8.39 pcre
cd pcre
./configure
make
make install
cd /opt/httpd-2.4.23
./configure
make
make install
ldconfig  
/usr/local/apache2/bin/apachectl start
cp /usr/local/apache2/bin/apachectl /etc/init.d/apachectl
chmod +x /etc/init.d/apachectl
sudo /usr/sbin/update-rc.d -f apachectl defaults
