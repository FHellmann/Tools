# Versions to install...
CV_VERSION=3.3.0
DLIB_VERSION=19.7



# Build tools
apt-get install -y build-essential cmake unzip wget libboost-all-dev

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake)
apt-get install -y qt5-default libvtk6-dev

# Media I/O
apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev

# Video I/O
apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libxine2-dev

# Parallelism and linear algebra libraries
apt-get install -y libtbb-dev libeigen3-dev

# Gstreamer
sudo apt-get install -y libxvidcore4 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-alsa gstreamer1.0-fluendo-mp3 gstreamer1.0-libav libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

# Java
apt-get install -y ant default-jdk

# Python
sudo apt-get -y install python python-dev python-pip
sudo -H pip install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython pandas sympy nose

# Documentation
apt-get install -y doxygen


# OpenCV
wget https://github.com/opencv/opencv/archive/${CV_VERSION}.zip
unzip ${CV_VERSION}.zip
rm ${CV_VERSION}.zip
mv opencv-${CV_VERSION} OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_IPP=ON -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DWITH_GSTREAMER=ON ..
make -j4
make install
ldconfig


# DLib
cd ~
wget http://dlib.net/files/dlib-${DLIB_VERSION}.tar.bz2
tar xvf dlib-${DLIB_VERSION}.tar.bz2
rm -r dlib-${DLIB_VERSION}.tar.bz2
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
rm -rf tools/python/build
rm python_examples/dlib.so
