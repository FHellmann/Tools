# requirements:
# sudo apt-get -y install git
# git config --global user.email ""
# git config --global user.name ""
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod +x /Tools/Xubuntu/installation-py.sh
# sudo ./Tools/Xubuntu/installation-py.sh > ~/install-py.log

# hyper-v settings
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
echo "Install hyper-v settings"
apt-get -y install linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial

# remote desktop connection
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
echo "Install rdp feature"
apt-get -y install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart

# Install programming languages
## python 2
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
echo "Install python 2"
apt-get -y install python python-dev python-pip
-H pip install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython ipython-notebook pandas sympy nose

# Install IDEs

## Intellij PyCharm
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
echo "Install IDE Intellij PyCharm"
add-apt-repository ppa:mystic-mirage/pycharm

# update everything
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

echo "Congratulations! Finished installation!"
