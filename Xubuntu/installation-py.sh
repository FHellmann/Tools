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
apt-get -y install python3-dev python3-pip
-H pip install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython ipython-notebook pandas sympy nose

# install dlib
wget http://dlib.net/files/dlib-19.4.tar.bz2
tar xvf dlib-19.4.tar.bz2
cd dlib-19.4/
mkdir build
cd build
cmake ..
cmake --build . --config Release
sudo make install
sudo ldconfig
cd ..

pkg-config --libs --cflags dlib-1

pip install dlib

python setup.py install
rm -rf dist
rm -rf tool/python/build
rm python examples/dlib.so
cd ..

# install IDE from Intellij PyCharm
add-apt-repository ppa:mystic-mirage/pycharm
apt-get update
apt-get -y install pycharm

# update everything
apt-get update

# restart system
#shutdown -r now
