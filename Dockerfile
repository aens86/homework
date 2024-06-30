FROM tomcat:latest
EXPOSE 8080
RUN apt update ; apt install maven -y 
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git  /tmp
RUN mvn package tmp/boxfuse-sample-java-war-hello
CMD ["catalina.sh", "run"]