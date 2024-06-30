FROM tomcat:latest
EXPOSE 8080
RUN apt update
RUN apt install maven -y ; apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git  
RUN mvn package /usr/local/tomcat/boxfuse-sample-java-war-hello
CMD ["catalina.sh", "run"]