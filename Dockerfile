FROM  tomcat:latest
EXPOSE 8080
RUN apt update
RUN  apt install openjdk-8-jdk -y
RUN apt install maven -y ; apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /usr/local/projekt ; 
RUN cd  /usr/local/projekt ; mvn package -X
RUN cp /usr/local/tomcat/projekt/target/hello-1.0.war /var/lib/tomcat/webapps/
CMD ["catalina.sh", "run"]