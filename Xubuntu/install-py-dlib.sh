echo "Install Dlib"
DLIB_VERSION=19.7

apt-get update
apt-get upgrade
apt-get install -y build-essential cmake
pip install boost
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
rm -rf tool/python/build
rm python_examples/dlib.so
pip install dlib