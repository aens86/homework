FROM  ubuntu:18.04
RUN apt update
RUN apt install default-jdk maven wget git -y
WORKDIR /home/user
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.90/bin/apache-tomcat-9.0.90-deployer.tar.gz
RUN tar xvf apache-tomcat-9.0.90-deployer.tar.gz
RUN mv apache-tomcat-9.0.90-deployer /opt/tomcat
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/user/boxfuse-sample-java-war-hello
RUN cd home/user/boxfuse-sample-java-war-hello; mvn package -X
RUN cp /home/user/boxfuse-sample-java-war-hello/target/hello-1.0.war /opt/tomcat/webapps/
CMD ["/opt/tomcat/bin/catalina.sh", "run"]