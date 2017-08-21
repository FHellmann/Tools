# requirements:
# sudo apt-get -y install git
# git config --global user.email ""
# git config --global user.name ""
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod +x /Tools/Xubuntu/installation-py.sh
# sudo ./Tools/Xubuntu/installation-py.sh > ~/install-py.log

# hyper-v settings
apt-get update
apt-get upgrade
echo "Install hyper-v settings"
apt-get -y install linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial

# remote desktop connection
apt-get update
apt-get upgrade
echo "Install rdp feature"
apt-get -y install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart

# Install programming languages
## python 3
apt-get update
apt-get upgrade
echo "Install python 3"
apt-get -y install python3-dev python3-pip
-H pip install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython ipython-notebook pandas sympy nose

# Install IDEs

## Intellij PyCharm
apt-get update
apt-get upgrade
echo "Install IDE Intellij PyCharm"
add-apt-repository ppa:mystic-mirage/pycharm
apt-get update

# Install Libraries
apt-get update
apt-get upgrade
apt-get -y install build-essential cmake pkg-config

## dlib
apt-get update
apt-get upgrade
echo "Install dlib"
apt-get -y install libgtk-3-dev
apt-get -y install libboost-all-dev
-H pip install -U dlib

## OpenCV
echo "Install OpenCV"
VERSION=3.2.0

apt-get update
apt-get upgrade
apt-get -y install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
apt-get -y install libxvidcore-dev libx264-dev
apt-get -y install libgtk-3-dev
apt-get -y install libatlas-base-dev gfortran

cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip
unzip opencv.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip
unzip opencv_contrib.zip

cd ~/opencv-${VERSION}/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=${HOME_DIR}/opencv_contrib-${VERSION}/modules \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -D BUILD_EXAMPLES=ON ..

make -j4
make install
ldconfig

cd ~
rm -rf opencv-${VERSION} opencv_contrib-${VERSION} opencv.zip opencv_contrib.zip

# update everything
apt-get update
apt-get upgrade

echo "Congratulations! Finished installation!"
