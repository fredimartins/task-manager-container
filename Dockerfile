FROM ubuntu:latest

# mongo 3.2
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# update ubuntu and set xterm for nano
ENV TERM xterm
RUN apt-get update
RUN apt-get -y upgrade

# java8
RUN apt-get -y --force-yes install openjdk-8-jdk

# tools
RUN apt-get -y --force-yes install git nano nodejs maven mongodb-org

# get taskmanager WS in git
RUN git clone https://github.com/fatercio/task-manager-exe5.git

# build project
RUN cd /task-manager-exe5 && mvn install

# run
CMD java -jar /task-manager-exe5/target/boot-rest-api-0.1.jar

#Port
EXPOSE 8080