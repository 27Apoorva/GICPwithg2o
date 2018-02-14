# GICP with g2o
# see instructions on http://pointclouds.org/downloads/linux.html to get PCL

# install dependent libraries on ubuntu (14.04)
#sudo apt-get install libsuitesparse-dev libqglviewer-dev libpcl-dev pcl-tools <br />
sudo apt-get install libsuitesparse-dev libqglviewer-dev libpcl-all-dev libpcl-bin cmake g++


# build instructions
mkdir build <br />
cd build <br />
make -j4 <br />

# test code when in directory coding-sample
build/src/test_gicp data/cloud00012.pcd data/cloud00034.pcd
