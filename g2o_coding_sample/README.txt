# see instructions on http://pointclouds.org/downloads/linux.html to get PCL

# install dependent libraries on ubuntu (16.04)
#sudo apt-get install libsuitesparse-dev libqglviewer-dev libpcl-dev pcl-tools
sudo apt-get install libsuitesparse-dev libqglviewer-dev libpcl-all-dev libpcl-bin cmake g++


# build instructions
mkdir build
cd build
make -j4

# complete code in src/test_gicp.cpp. There are 8 TODOs that need to be implemented!


# test code when in directory coding-sample
build/src/test_gicp data/cloud00012.pcd data/cloud00034.pcd
