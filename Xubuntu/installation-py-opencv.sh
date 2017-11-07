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
cmake -DWITH_IPP=ON -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -D WITH_GSTREAMER=ON ..
make -j4
make install
ldconfig

pip install opencv-python