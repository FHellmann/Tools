# requirements:
# sudo apt-get install git
# git clone https://github.com/FHellmann/Tools.git
# sudo chmod -x /Tools/Xubuntu/installation.sh
# sudo /Tools/Xubuntu/installation.sh > ~/install.log

# update everything
apt-get update 

# hyper-v settings
apt-get install hv-kvp-daemon-init linux-tools-virtual linux-cloud-tools-virtual

# remote desktop connection
apt-get install ubuntu-desktop xrdp
echo xfce4-session > ~/.xsession
service xrdp restart

# java / eclipse / c++
apt-get install default-jre eclipse eclipse-cdt g++
echo "
[Desktop Entry]
Name=Eclipse 
Type=Application
Exec=/usr/lib/eclipse/eclipse
Terminal=false
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE
Name[en]=Eclipse
" > /usr/share/applications/eclipse.desktop

# cuda / nsight
CUDA_REPO_PKG=cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG} 
dpkg -i /tmp/${CUDA_REPO_PKG}
rm -f /tmp/${CUDA_REPO_PKG}
apt-get update
apt-get install cuda-drivers

apt-get install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-nsight
echo "
[Desktop Entry]
Name=Nsight 
Type=Application
Exec=/usr/lib/nvidia-nsight/nsight
Terminal=false
Icon=/usr/lib/nvidia-nsight/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE
Name[en]=Nsight
" > /usr/share/applications/nsight.desktop

# GPU Computing SDK
apt-get install build-essential freeglut3-dev libgl1-mesa-glx libglu1-mesa-dev libx11-dev libxi-dev libxmu-dev 

# update everything
apt-get update

# restart system
#shutdown -r now