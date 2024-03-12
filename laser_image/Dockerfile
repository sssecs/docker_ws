#Set up libpcap (laser scanner)
RUN apt-get update \
  && apt-get install -y libpcap-dev\
  && rm -rf /var/lib/apt/lists/*


#Set up diagnostic-updater (laser scanner)
RUN apt-get update \
  && apt-get install -y ros-foxy-diagnostic-updater\
  && rm -rf /var/lib/apt/lists/*