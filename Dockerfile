FROM  ubuntu:18.04
RUN apt update
RUN apt install default-jdk maven wget git -y
WORKDIR /home/user
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz
RUN tar -zxvf apache-tomcat-9.0.45.tar.gz
RUN mv apache-tomcat-9.0.45 /opt/tomcat
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 

WORKDIR /home/user/boxfuse-sample-java-war-hello
RUN mvn package 
RUN cp /home/user/boxfuse-sample-java-war-hello/target/hello-1.0.war /opt/tomcat/webapps/
CMD ["/opt/tomcat/bin/catalina.sh", "run"]