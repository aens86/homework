FROM tomcat:9.0
EXPOSE 8080
RUN apt update
RUN apt install maven -y ; apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /usr/local/tomcat/projekt ; 
RUN cd  /usr/local/tomcat/projekt ; mvn package
CMD ["catalina.sh", "run"]