# requirements:
# sudo apt-get -y install git
# git config --global user.email ""
# git config --global user.name ""
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod +x /Tools/Xubuntu/installation-py.sh
# sudo ./Tools/Xubuntu/installation-py.sh > ~/install-py.log

# remote desktop connection
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
echo "Install rdp feature"
apt-get -y install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart
