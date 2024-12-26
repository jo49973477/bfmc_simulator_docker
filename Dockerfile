# Based on ROS Noetic
FROM osrf/ros:noetic-desktop-full
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /root

# Update and install dependencies (git, catkin tools)
RUN apt update && apt install -y \
    git \
    python3-catkin-tools && \
    rm -rf /var/lib/apt/lists/*

# Clone the BFMC simulator repository
RUN git clone https://github.com/ECC-BFMC/Simulator

# Build the workspace
WORKDIR /root/Simulator

# Source the ROS setup and build the catkin workspace in a single step
RUN . /opt/ros/noetic/setup.bash && \
    catkin_make && \
    echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc && \
    echo 'source /root/Simulator/devel/setup.bash' >> ~/.bashrc && \
    echo 'export GAZEBO_MODEL_PATH="/root/Simulator/src/models_pkg:$GAZEBO_MODEL_PATH"' >> ~/Simulator/devel/setup.bash && \
    echo 'export ROS_PACKAGE_PATH="/root/Simulator/src:$ROS_PACKAGE_PATH"' >> ~/Simulator/devel/setup.bash

# Add rosenv alias to .bashrc (to source setup.bash easily)
RUN echo 'alias rosenv="source /root/Simulator/devel/setup.bash"' >> ~/.bashrc

# Default command to run when the container starts
CMD ["bash"]
