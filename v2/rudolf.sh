############# Just for fun #############
sudo apt-get update
sudo apt-get install --assume-yes tree curl make vim



######
TODO : Prompt if you want real java or open jdk, open jdk should work for most cases,
but for hadoop, you want sun.
#######

###SUN JAVA###

wget https://raw.github.com/flexiondotorg/oab-java6/master/oab-java.sh -O oab-java6.sh
chmod +x oab-java6.sh
sudo ./oab-java6.sh
sudo apt-get install sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk sun-java6-jre sun-java6-plugin sun-java6-source
sudo apt-get install sun-java6-jre sun-java6-plugin
sudo apt-get install ant
sudo apt-get install ant-optional


############ CLOJURE ####################
sudo wget -qO /usr/local/bin/lein http://github.com/technomancy/leiningen/raw/stable/bin/lein
sudo chmod 755 /usr/local/bin/lein
echo "self install ..."
/usr/local/bin/lein self-install

############ THRIFT #####################
package="thrift"
version="0.7.0"
sudo apt-get install --assume-yes libboost-dev libevent-dev libtool flex bison g++ automake pkg-config libboost-test-dev
cd /tmp 
wget -q http://archive.apache.org/dist/${package}/${version}/${package}-${version}.tar.gz
tar xzf ${package}-${version}.tar.gz
cd ${package}-${version}
chmod 755 configure
./configure 
make 
sudo make install 

############# MySQL ####################
INSTALLER_LOG=/var/log/non-interactive-installer.log
installnoninteractive(){
  sudo bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $* >> $INSTALLER_LOG"
}
installnoninteractive mysql-server
echo "Now installing clojure via lein"

############# VW6 ######################

# for yum, run s/apt-get/yum/g on this script, 
# and run sudo yum install boost-devel  
# also, remove the --assume-yes (its only an apt-get option).
sudo apt-get install make --assume-yes
sudo apt-get install g++ --assume-yes
sudo apt-get install libboost-all-dev --assume-yes 
sudo apt-get install unzip --assume-yes
wget -S 'https://github.com/JohnLangford/vowpal_wabbit/zipball/6.0'
mv 6.0 6.0.zip
unzip 6.0.zip
cd JohnLangford-vowpal_wabbit-a29e25d/
echo "making and installing vw now ..."
sudo make install &> vw_log.txt
echo "There are a couple of minor, expected errors in vw 6.0 installation. See the vw_log.txt for them"
echo "done making/installing vw. now copying it"
sudo cp vw /usr/bin/vw6
cd
vw6 --version

########### YIPEEEEE ####################
echo "Done ! Welcome to RudolF !" 

echo "Now make sure to add -- export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.33/ to your .bashrc file for running ant."


