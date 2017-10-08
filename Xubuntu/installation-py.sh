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

## OpenCV (https://www.learnopencv.com/install-opencv3-on-ubuntu/)
echo "Install OpenCV"
CV_VERSION=3.3.0

apt-get update
apt-get upgrade
apt-get -y remove x264 libx264-dev
apt-get -y install build-essential checkinstall cmake pkg-config yasm gfortran git
apt-get -y install libjpeg8-dev libjasper-dev libpng12-dev
apt-get -y install libtiff5-dev
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
apt-get -y install libxine2-dev libv4l-dev
apt-get -y install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
apt-get -y install libqt4-dev libgtk2.0-dev libtbb-dev
apt-get -y install libatlas-base-dev
apt-get -y install libfaac-dev libmp3lame-dev libtheora-dev
apt-get -y install libvorbis-dev libxvidcore-dev
apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev
apt-get -y install x264 v4l-utils
# optional dependencies
apt-get -y install libprotobuf-dev protobuf-compiler
apt-get -y install libgoogle-glog-dev libgflags-dev
apt-get -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

cd ~
mkdir OpenCV-tmp
cd OpenCV-tmp
git clone https://github.com/Itseez/opencv.git
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ../opencv
make -j $(nproc --all)
make install

## Dlib (https://www.learnopencv.com/install-dlib-on-ubuntu/)
echo "Install Dlib"
DLIB_VERSION=19.7

apt-get update
apt-get upgrade
cd ~
wget http://dlib.net/files/dlib-${DLIB_VERSION}.tar.bz2
tar xvf dlib-${DLIB_VERSION}.tar.bz2
cd dlib-${DLIB_VERSION}/
mkdir build
cd build
cmake ..
cmake --build . --config Release
make install
ldconfig
cd ..
pkg-config --libs --cflags dlib-1
python setup.py install
rm -rf dist
rm -rf tool/python/build
rm python_examples/dlib.so
pip install dlib

## Face Recognition (https://github.com/ageitgey/face_recognition)
pip install face_recognition

# update everything
apt-get update
apt-get upgrade

echo "Congratulations! Finished installation!"
