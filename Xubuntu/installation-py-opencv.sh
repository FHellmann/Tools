echo "Install OpenCV"
CV_VERSION=3.3.0

apt-get update
apt-get upgrade
apt-get remove x264 libx264-dev
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
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout ${CV_VERSION}
cd ..
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout ${CV_VERSION}
cd ..
cd opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..
make -j4
make install
sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
ldconfig