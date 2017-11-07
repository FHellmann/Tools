# requirements:
# sudo apt-get -y install git
# git config --global user.email ""
# git config --global user.name ""
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod +x /Tools/Xubuntu/installation-py.sh
# sudo ./Tools/Xubuntu/installation-py.sh > ~/install-py.log

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

# hyper-v settings
echo "Install hyper-v settings"
apt-get -y install linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial

# remote desktop connection
echo "Install rdp feature"
apt-get -y install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart

# Install programming languages
## python 2
echo "Install python 2"
apt-get -y install python python-dev python-pip build-essential cmake pkg-config libx11-dev libatlas-base-dev libgtk-3-dev libboost-python-dev
-H pip install -U numpy scipy matplotlib scikit-image scikit-learn

# Install IDEs

## Intellij PyCharm
echo "Install IDE Intellij PyCharm"
add-apt-repository ppa:mystic-mirage/pycharm

## OpenCV
echo "Install OpenCV"
apt-get -y install python-opencv

## Dlib
echo "Install Dlib"
pip install dlib

## Face Recognition
pip install face_recognition

# update everything
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

echo "Congratulations! Finished installation!"
