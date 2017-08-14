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

rm dlib-19.4.tar.bz2

# install IDE from Intellij PyCharm
echo "Install IDE Intellij PyCharm"
wget https://download.jetbrains.com/python/pycharm-community-2017.2.1.tar.gz
tar xvf pycharm-community-2017.2.1.tar.gz
cd pycharm-community-2017.2.1
chmod -x /bin/pycharm.sh
cd ..
mv pycharm-community-2017.2.1 /usr/lib/pycharm-community-2017.2.1
echo sudo /usr/lib/pycharm-community-2017.2.1/bin/pycharm.sh > pycharm.sh
chmod -x /usr/lib/pycharm-community-2017.2.1/bin/pycharm.sh
chmod -x pycharm.sh

rm pycharm-community-2017.2.1.tar.gz

# install OpenCV dependencies
echo "Install OpenCV"
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install build-essential -y
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y

sudo apt-get install python-tk libqt4-dev libqt4-opengl-dev  libeigen3-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev default-jdk ant -y


echo "GUI and openGL extensions"
sudo apt-get install qt4-default libqt4-opengl-dev libvtk5-qt4-dev libgtk2.0-dev libgtkglext1 libgtkglext1-dev -y

echo "image manipulation libraries"
sudo apt-get install libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev -y
sudo apt-get install libjpeg-dev libjpeg9 libjpeg9-dbg libjpeg-progs libtiff5-dev libtiff5 libtiffxx5 libtiff-tools libjasper-dev libjasper1  libjasper-runtime zlib1g zlib1g-dbg zlib1g-dev -y

echo "video manipulation libraries"
sudo apt-get install libavformat-dev libavutil-ffmpeg54 libavutil-dev libxine2-dev libxine2 libswscale-dev libswscale-ffmpeg3 libdc1394-22 libdc1394-22-dev libdc1394-utils -y

echo "codecs"
sudo apt-get install libavcodec-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install libtheora-dev libvorbis-dev libxvidcore-dev -y
sudo apt-get install ffmpeg x264 libx264-dev -y
sudo apt-get install libv4l-0 libv4l v4l-utils -y

echo "multiproccessing library"
sudo apt-get install libtbb-dev -y

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