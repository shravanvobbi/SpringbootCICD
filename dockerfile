FROM centos7

MAINTAINER Shravan Vobbilisetty <vshravan818@gmail.com>

EXPOSE 8080

ENV JAVA_VER=1.8.0

RUN yum install -y wget \
        yum install -y java-1.8.0-openjdk-headless \
        yum clean all

RUN mkdir /SpringbootCICD        

# Add jar file from jenkins workspace or from S3/Artifactory

ADD dockerproject-1.0.jar /SpringbootCICD

WORKDIR /SpringbootCICD

RUN chown -R 1001:1001 /SpringbootCICD

USER 1001

#RUN bash -c "touch /projectname//projectname-1.0.jar"

#ENTRYPOINT exec java $JAVA_OPTS -jar /projectname//projectname-1.0.jar


CMD ["java","-jar","/SpringbootCICD-1.0.jar"]

