FROM ubuntu:latest
RUN echo 'debconf debconf/frontend select Noninteractive'| debconf-set-selections
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install git
RUN apt-get -y install openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get -y update && apt-get -y install maven
RUN pwd
RUN mvn clean install -Dmaven.test.skip=true
RUN mkdir /usr/local/tomcat
RUN pwd
ADD https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz /tmp/docker/tomcat.tar.gz
RUN tar xvfz tomcat.tar.gz
RUN pwd
RUN ls -a
RUN cp -Rv /tmp/docker/apache-tomcat-8.5.33/* /usr/local/tomcat/
EXPOSE 8181
RUN cp /AssigningTask/target/Spring201-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/Spring201-0.0.1-SNAPSHOT.war
CMD /usr/local/tomcat/bin/catalina.sh run
