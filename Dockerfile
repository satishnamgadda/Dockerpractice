FROM ubuntu:20.04
RUN apt update && \
    apt install openjdk-11-jdk wget -y && \
    wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar 
EXPOSE 8080
CMD ["java","-jar","/spring-petclinic-2.4.2.jar"]
     
-------------------------

FROM openjdk:11
RUN  wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar 
EXPOSE 8080
CMD ["java","-jar","/spring-petclinic-2.4.2.jar"]
-----------------------------------------------

FROM openjdk:11
RUN apt install maven -y && \ 
     git clone https://github.com/satishnamgadda/spring-petclinic.git && \
      cd /spring-petclinic && \
      mvn package 
EXPOSE 8080      
CMD ["java","-jar","/spring-petclinic-2.4.2.jar"]   

--------------------------------------------------------------

FROM maven:3.8.6-openjdk-11 as build
ARG  BRANCH=main
RUN   git clone https://github.com/satishnamgadda/spring-petclinic.git && \
      cd /spring-petclinic && \
      git checkout ${BRANCH} && \
      mvn package 

FROM openjdk:11
LABEL author="me"
LABEL project="qt"
EXPOSE 8080
COPY  --from=build /spring-petclinic/target/spring-petclinic-2.7.3.jar /spring-petclinic-2.7.3.jar
CMD ["java","-jar","/spring-petclinic-2.7.3.jar"]   

-------------------------------------------------------

FROM alpine
RUN apk add git


