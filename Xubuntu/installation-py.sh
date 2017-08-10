# requirements:
# sudo apt-get -y install git
# git config --global user.email ""
# git config --global user.name ""
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod +x /Tools/Xubuntu/installation-py.sh
# sudo ./Tools/Xubuntu/installation-py.sh > ~/install-py.log

# update everything
apt-get update 

# hyper-v settings
apt-get -y install linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial
#apt-get -y install linux-virtual-lts-xenial

# remote desktop connection
apt-get -y install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart

# install python
apt-get -y install python3
apt-get -y install python3-doc


# install IDE from Intellij PyCharm
add-apt-repository ppa:mystic-mirage/pycharm
apt-get update
apt-get -y install pycharm

# install libraries for python
apt-get -y install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

# update everything
apt-get update

# restart system
#shutdown -r now
