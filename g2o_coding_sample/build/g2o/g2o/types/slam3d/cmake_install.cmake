# Install script for directory: /home/appu/g2o_coding_sample/g2o/g2o/types/slam3d

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libg2o_types_slam3d.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE SHARED_LIBRARY FILES "/home/appu/g2o_coding_sample/g2o/lib/libg2o_types_slam3d.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so"
         OLD_RPATH "/home/appu/g2o_coding_sample/g2o/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/lib/libg2o_types_slam3d.so")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/g2o/types/slam3d/dquat2mat.h;/usr/local/include/g2o/types/slam3d/edge_pointxyz.h;/usr/local/include/g2o/types/slam3d/edge_se3.h;/usr/local/include/g2o/types/slam3d/edge_se3_lotsofxyz.h;/usr/local/include/g2o/types/slam3d/edge_se3_offset.h;/usr/local/include/g2o/types/slam3d/edge_se3_pointxyz.h;/usr/local/include/g2o/types/slam3d/edge_se3_pointxyz_depth.h;/usr/local/include/g2o/types/slam3d/edge_se3_pointxyz_disparity.h;/usr/local/include/g2o/types/slam3d/edge_se3_prior.h;/usr/local/include/g2o/types/slam3d/edge_se3_prior_imu.h;/usr/local/include/g2o/types/slam3d/g2o_types_slam3d_api.h;/usr/local/include/g2o/types/slam3d/isometry3d_gradients.h;/usr/local/include/g2o/types/slam3d/isometry3d_mappings.h;/usr/local/include/g2o/types/slam3d/parameter_camera.h;/usr/local/include/g2o/types/slam3d/parameter_se3_offset.h;/usr/local/include/g2o/types/slam3d/parameter_stereo_camera.h;/usr/local/include/g2o/types/slam3d/se3_ops.h;/usr/local/include/g2o/types/slam3d/se3quat.h;/usr/local/include/g2o/types/slam3d/types_slam3d.h;/usr/local/include/g2o/types/slam3d/vertex_pointxyz.h;/usr/local/include/g2o/types/slam3d/vertex_se3.h;/usr/local/include/g2o/types/slam3d/se3_ops.hpp")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/include/g2o/types/slam3d" TYPE FILE FILES
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/dquat2mat.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_pointxyz.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_lotsofxyz.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_offset.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_pointxyz.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_pointxyz_depth.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_pointxyz_disparity.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_prior.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/edge_se3_prior_imu.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/g2o_types_slam3d_api.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/isometry3d_gradients.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/isometry3d_mappings.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/parameter_camera.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/parameter_se3_offset.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/parameter_stereo_camera.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/se3_ops.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/se3quat.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/types_slam3d.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/vertex_pointxyz.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/vertex_se3.h"
    "/home/appu/g2o_coding_sample/g2o/g2o/types/slam3d/se3_ops.hpp"
    )
endif()

