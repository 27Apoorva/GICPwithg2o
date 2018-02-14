#include <iostream>
#include <vector>

#include "g2o/core/factory.h"
#include "g2o/core/sparse_optimizer.h"
#include "g2o/core/optimizable_graph.h"
#include "g2o/core/solver.h"
#include "g2o/core/block_solver.h"
#include "g2o/core/optimization_algorithm_levenberg.h"
#include "g2o/core/optimization_algorithm_gauss_newton.h"
#include "g2o/core/robust_kernel_factory.h"
#include "g2o/solvers/eigen/linear_solver_eigen.h"
#include "g2o/types/slam3d/types_slam3d.h"
#include "g2o/types/icp/types_icp.h"

#include <pcl/console/parse.h>
#include <pcl/point_cloud.h>
#include <pcl/kdtree/kdtree_flann.h>
#include <pcl/io/pcd_io.h>

#include <cmath>
#include <cfloat>

void dropDataAssociation(std::vector<g2o::Edge_V_V_GICP*>& da_edges, g2o::SparseOptimizer* optimizer) {
  if(optimizer != NULL){
    for (size_t i = 0; i < da_edges.size(); ++i) {
      g2o::Edge_V_V_GICP*& e = da_edges[i];
      if (e) {
        optimizer->removeEdge(e);
      }
    }
    da_edges.clear();
  } else {
    std::cerr << __PRETTY_FUNCTION__ << ": invalid optimizer pointer, can not remove edges" << std::endl;
  }

}

// coding test
// Implement GICP with g2o
// There are 8 todos that need to be implemented. The following websites might help:
// https://github.com/RainerKuemmerle/g2o/blob/master/g2o/examples/icp/gicp_demo.cpp
// http://pointclouds.org/documentation/tutorials/kdtree_search.php

//Function to check if point has inf or nan values or not
// used cmath header file
bool isValid(pcl::PointXYZINormal check_points)
{
  if(std::isnan(check_points.x) || std::isinf(check_points.x) ||std::isnan(check_points.y) || std::isinf(check_points.y)||std::isnan(check_points.z) || std::isinf(check_points.z) )
  {
    return false;
  }
  else
  {
    return true;
  }
}

int main(int argc, char **argv) {

  std::vector<int> p_file_indices;
  p_file_indices = pcl::console::parse_file_extension_argument (argc, argv, ".pcd");


  pcl::PointCloud<pcl::PointXYZINormal>::Ptr cloud_a (new pcl::PointCloud<pcl::PointXYZINormal>);
  pcl::PointCloud<pcl::PointXYZINormal>::Ptr cloud_b (new pcl::PointCloud<pcl::PointXYZINormal>);

  if(p_file_indices.size() != 2){
    std::cerr << "need two point clouds to run GICP" << std::endl;
    exit(1);
  }

  // loading point clouds
  pcl::io::loadPCDFile(argv[p_file_indices[0]], *cloud_a);
  pcl::io::loadPCDFile(argv[p_file_indices[1]], *cloud_b);

  // creating a kdtree on cloud A for nearest neighbor queries
  pcl::KdTreeFLANN<pcl::PointXYZINormal> kdtree;
  kdtree.setInputCloud (cloud_a);

  // maximum distance for a valid correspondence
  float max_squared_distance = 1.0f;

  size_t number_of_iterations = 10;

  /** setting up g2o optimizer and two graph nodes
      (one node for every point cloud)
  */
  g2o::SparseOptimizer* optimizer = new g2o::SparseOptimizer;
  g2o::BlockSolverX::LinearSolverType *linearSolver =
      new g2o::LinearSolverEigen<typename g2o::BlockSolverX::PoseMatrixType>;  //Eigen solver
  g2o::BlockSolver<g2o::BlockSolverTraits<-1, -1> > *blockSolver =
      new g2o::BlockSolver<g2o::BlockSolverTraits<-1, -1> >(linearSolver);
  g2o::OptimizationAlgorithmLevenberg *solver =
      new g2o::OptimizationAlgorithmLevenberg(blockSolver);
  optimizer->setVerbose(false);
  optimizer->setAlgorithm(solver);

  g2o::VertexSE3* vertex_a = new g2o::VertexSE3;
  vertex_a->setFixed(true);
  vertex_a->setId(1);
  vertex_a->setEstimate(Eigen::Isometry3d::Identity());
  optimizer->addVertex(vertex_a);

  g2o::VertexSE3* vertex_b = new g2o::VertexSE3;
  vertex_b->setId(2);
  optimizer->addVertex(vertex_b);

  Eigen::Isometry3d transformationd = Eigen::Isometry3d::Identity();
  vertex_b->setEstimate(transformationd);

  // we store the data association edges in this vector
  std::vector<g2o::Edge_V_V_GICP*> da_edges;

  int k = 1;
  std::vector<int> pointIdxNKNSearch(k);
  std::vector<float> pointNKNSquaredDistance(k);

  g2o::OptimizableGraph::Vertex* v_a =
      static_cast<g2o::OptimizableGraph::Vertex *>(vertex_a);
  g2o::OptimizableGraph::Vertex* v_b =
      static_cast<g2o::OptimizableGraph::Vertex *>(vertex_b);

  for(size_t iteration = 0; iteration < number_of_iterations; ++iteration)
  {
    // drop existing data association or point correspondences
    dropDataAssociation(da_edges, optimizer);

    // we need to compute a data association (corresponding points)
    // between the cloud_a and the cloud_b
    Eigen::Isometry3f transformation = vertex_b->estimate().cast<float>();

    for(size_t i = 0; i < cloud_b->size(); ++i)
    {
      pcl::PointXYZINormal point_b = cloud_b->at(i);
      point_b.getVector3fMap() = transformation * point_b.getVector3fMap();

      // 1) TODO: check that point is valid and does not have inf or nan values
      if(isValid(point_b)) //Created a function to check validity  of point
      {
        //  std::cout << "checks: " <<point_b.x<<" "<< point_b.y <<" "<<point_b.z<< '\n';

        // 2) TODO: perform a nearest neighbor query in kdtree to get the nearest neighbor
        // have a look at http://pointclouds.org/documentation/tutorials/kdtree_search.php
        //Search for the nearest neighbour of pointb (from cloud_b) in KD Tree of cloud_a
        if ( kdtree.nearestKSearch(point_b, k, pointIdxNKNSearch, pointNKNSquaredDistance) > 0 )
        {
            for (size_t j = 0; j < pointIdxNKNSearch.size(); ++j)
            {
              // 3) TODO: if the distance between the point and its correspondence in cloud_a
              // is below max_squared_distance we create an Edge
              if(pointNKNSquaredDistance[j]<max_squared_distance)
              {
                // 4) TODO: create a g2o::Edge_V_V_GICP and set vertices()[0] and vertices()[1]
                g2o::Edge_V_V_GICP * edge = new g2o::Edge_V_V_GICP();
                //std::cout << "vertex: " << v_a<<" "<<v_b <<'\n';
                edge->setVertex(0, v_a);
                edge->setVertex(1, v_b);
                // 5) TODO: set the EdgeGicp measurement in the edge
                Eigen::Vector3d pt0;
                Eigen::Vector3d pt1;
                pt0 << point_b.x,point_b.y,point_b.z;
                pt1 << cloud_a->points[ pointIdxNKNSearch[j] ].x,cloud_a->points[ pointIdxNKNSearch[j] ].y,cloud_a->points[ pointIdxNKNSearch[j] ].z;
                Eigen::Vector3d nm0;
                Eigen::Vector3d nm1;
                nm0 << 0, i, 1;
                nm1 << 0, i, 1;
                nm0.normalize();
                nm1.normalize();
                g2o::EdgeGICP meas;
                meas.pos0    = pt0;
                meas.pos1    = pt1;
                meas.normal0 = nm0;
                meas.normal1 = nm1;
                //std::cout << "pos1: " << meas.pos1<<'\n';
                //std::cout << "pos0: " << meas.pos0<<'\n';
                //std::cout << "nm0: "  << meas.normal0<<'\n';
                //std::cout << "nm1: "  << meas.normal1<<'\n';
                edge->setMeasurement(meas);
                // set to point-point  (uncomment once edge is properly created)
                edge->information().setIdentity();

                // add edge to optimizer and to da_edges; (uncomment once edge is properly created)
                da_edges.push_back(edge);

                // 6) TODO: add edge to optimizer and to da_edges
                optimizer->addEdge(edge);
              }

            }
          }
        }
      }




    // 7) TODO: once we have created all edges we need to initialize the opimization
    optimizer->initializeOptimization();
    //per iteration debug output
    std::cerr << " number of correspondences " << da_edges.size();
    optimizer->computeActiveErrors();
    std::cerr << " initial chi2 = " << FIXED(optimizer->chi2()) << std::endl;

    // 8) TODO: tell optimizer to optimize one iteration
    optimizer->optimize(1);
  }

  std::cerr << "resulting transformation is: " << std::endl << vertex_b->estimate().matrix() << std::endl;
  optimizer->removeVertex(vertex_a);
  optimizer->removeVertex(vertex_b);
  delete optimizer;
}
