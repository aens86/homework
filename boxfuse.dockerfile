FROM tomcat:11.0.0-M21-jdk21-temurin-jammy
RUN apt update
RUN apt install maven -y
RUN apt install git -y
RUN cd /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd tmp/boxfuse-sample-java-war-hello
RUN mvn package 
CMD ["catalina.sh", "run"]