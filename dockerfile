FROM centos7

MAINTAINER Chenna Vemula <chennarao.py@gmail.com>

EXPOSE 8080

ENV JAVA_VER=1.8.0

RUN yum install -y wget \
        yum install -y java-1.8.0-openjdk-headless \
        yum clean all

RUN mkdir /projectname        

# Add jar file from jenkins workspace or from S3/Artifactory

ADD projectname-1.0.jar /projectname

WORKDIR /projectname

RUN chown -R 1001:1001 /projectname

USER 1001

#RUN bash -c "touch /projectname//projectname-1.0.jar"

#ENTRYPOINT exec java $JAVA_OPTS -jar /projectname//projectname-1.0.jar


CMD ["java","-jar","/projectname-1.0.jar"]

