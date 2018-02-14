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

# Explanation
Task: To implement GICP(Generalized Iterative Closest Point) Algorithm with g2o.
GICP is generally used for scan matching.
Given two point cloud data, GICP can be used to calculate point correspondence.
One cloud data is used to construct a KD Tree.
KD Tree is a K-Dimensional Tree which is a BInary Tree. Each data point of the node is a
K-DImensional point in space. It is used as it can help in easy searching of even 3D Data points.
g2o is Graph Optimization LIbrary
There are two nodes in this graph. Each node represents the cloud data respectively.
The data association is represented by edge.
The points in cloud_b are the search points and these points are searched in the KD Tree of
cloud_a.
When the closest neighbour is found, the sum of squared distance between those two points is
calculated and compared with max_squared_error.
If the distance is less, then edge between two nodes(vertex_a and vertex_b) is created.
After adding all the edges, the graph is optimized using LM algorithm. Only one iteration is
performed.
