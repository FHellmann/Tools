# requirements:
# sudo apt-get -y install git
# git config --global user.email ""
# git config --global user.name ""
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod +x /Tools/Xubuntu/installation-py.sh
# sudo ./Tools/Xubuntu/installation-py.sh > ~/install-py.log

# update everything
echo "Update apt-get"
apt-get update

# hyper-v settings
echo "Install hyper-v settings"
apt-get -y install linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial

# remote desktop connection
echo "Install rdp feature"
apt-get -y install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart

# install python
echo "Install python 3 with numpy, scipy, etc."
apt-get -y install python3-dev python3-pip
-H pip install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython ipython-notebook pandas sympy nose

# install dlib
echo "Install dlib"
apt-get -y install build-essential cmake
apt-get -y install libgtk-3-dev
apt-get -y install libboost-all-dev
-H pip install -U dlib

# install IDE from Intellij PyCharm
echo "Install IDE Intellij PyCharm"
add-apt-repository ppa:mystic-mirage/pycharm
apt-get update

# install OpenCV dependencies
echo "Install OpenCV"
apt-get update
apt-get -y upgrade

apt-get -y install build-essential
apt-get -y install cmake libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

apt-get -y install python-tk libqt4-dev libqt4-opengl-dev  libeigen3-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev default-jdk ant


echo "GUI and openGL extensions"
apt-get -y install qt4-default libqt4-opengl-dev libvtk5-qt4-dev libgtk2.0-dev libgtkglext1 libgtkglext1-dev

echo "image manipulation libraries"
apt-get -y install libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev
apt-get -y install libjpeg-dev libjpeg9 libjpeg9-dbg libjpeg-progs libtiff5-dev libtiff5 libtiffxx5 libtiff-tools libjasper-dev libjasper1  libjasper-runtime zlib1g zlib1g-dbg zlib1g-dev

echo "video manipulation libraries"
apt-get -y install libavformat-dev libavutil-ffmpeg54 libavutil-dev libxine2-dev libxine2 libswscale-dev libswscale-ffmpeg3 libdc1394-22 libdc1394-22-dev libdc1394-utils

echo "codecs"
apt-get -y install libavcodec-dev
apt-get -y install libfaac-dev libmp3lame-dev
apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev
apt-get -y install libtheora-dev libvorbis-dev libxvidcore-dev
apt-get -y install ffmpeg x264 libx264-dev
apt-get -y install libv4l-0 libv4l v4l-utils

echo "multiproccessing library"
apt-get -y install libtbb-dev

echo "finally download and install opencv"
mkdir opencv
cd opencv
wget "https://github.com/Itseez/opencv/archive/2.4.13.zip"
unzip opencv-2.4.13.zip

cd opencv
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE \
 -DCMAKE_INSTALL_PREFIX=/usr/local \
 -DINSTALL_C_EXAMPLES=ON \
 -DINSTALL_PYTHON_EXAMPLES=ON \
 -DBUILD_EXAMPLES=ON \
 -DBUILD_opencv_cvv=OFF \
 -DBUILD_NEW_PYTHON_SUPPORT=ON \
 -DWITH_TBB=ON \
 -DWITH_V4L=ON \
 -DWITH_QT=ON \
 -DWITH_OPENGL=ON \
 -DWITH_VTK=ON ..

echo "making and installing"
make -j8
make install

echo "finishing off installation"
/bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
ldconfig

cd ../../
rm opencv-2.4.13.zip

# update everything
apt-get update

# restart system
#shutdown -r now

echo "Congratulations! Finished installation!"