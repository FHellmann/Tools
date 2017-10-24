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

# Install Libraries
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y install build-essential cmake pkg-config

## OpenCV
echo "Install OpenCV"
CV_VERSION=3.3.0

# KEEP UBUNTU OR DEBIAN UP TO DATE
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
apt-get install -y qt5-default libvtk6-dev

# Media I/O:
apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
apt-get install -y libtbb-dev libeigen3-dev

# Python:
apt-get install -y python3-dev python3-tk python3-numpy

# Java:
apt-get install -y ant default-jdk

# Documentation:
apt-get install -y doxygen


# INSTALL THE LIBRARY

apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/${CV_VERSION}.zip
unzip ${CV_VERSION}.zip
rm ${CV_VERSION}.zip
mv opencv-${CV_VERSION} OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_IPP=ON -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
make -j4
make install
ldconfig

pip install opencv-python

## Dlib (https://www.learnopencv.com/install-dlib-on-ubuntu/)
echo "Install Dlib"
DLIB_VERSION=19.7

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
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
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

echo "Congratulations! Finished installation!"
