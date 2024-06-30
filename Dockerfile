FROM tomcat:latest
EXPOSE 8080
RUN apt update
RUN apt install maven -y ; apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /usr/local/tomcat/new1 ; mvn package /usr/local/tomcat/new1/usr/local/tomcat/new1
CMD ["catalina.sh", "run"]