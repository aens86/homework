FROM  ubuntu:18.04
EXPOSE 8080
RUN apt update
RUN apt install default-jdk8 -y; apt install tomcat9 -y
RUN apt install maven -y ; apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /usr/local/tomcat/projekt ; 
RUN cd  /usr/local/tomcat/projekt ; mvn package -X
RUN cp /usr/local/tomcat/projekt/target/hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]