FROM osrf/ros:foxy-desktop


# Example of installing programs
RUN apt-get update \
    && apt-get install -y \
    nano \
    vim \
    && rm -rf /var/lib/apt/lists/*



# Create a non-root user
ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# Set up lsusb
RUN apt-get update \
  && apt-get install -y usbutils\
  && rm -rf /var/lib/apt/lists/*


# Set up sudo
RUN apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && rm -rf /var/lib/apt/lists/*


#Set up ros2 control
RUN apt-get update \
  && apt-get install -y ros-foxy-ros2-control\
  && rm -rf /var/lib/apt/lists/*


#Set up ros2 controllers
RUN apt-get update \
  && apt-get install -y ros-foxy-ros2-controllers\
  && rm -rf /var/lib/apt/lists/*


#Set up xacro
RUN apt-get update \
  && apt-get install -y ros-foxy-xacro\
  && rm -rf /var/lib/apt/lists/*


#Set up libserial
RUN apt-get update \
  && apt-get install -y libserial-dev\
  && rm -rf /var/lib/apt/lists/*


#Set up libpcap (laser scanner)
RUN apt-get update \
  && apt-get install -y libpcap-dev\
  && rm -rf /var/lib/apt/lists/*


#Set up diagnostic-updater (laser scanner)
RUN apt-get update \
  && apt-get install -y ros-foxy-diagnostic-updater\
  && rm -rf /var/lib/apt/lists/*