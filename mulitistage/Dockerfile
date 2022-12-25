FROM maven:3.8.6-openjdk-11 as build
ARG BRANCH="main"
RUN  git clone https://github.com/satishnamgadda/spring-petclinic.git && \
     cd /spring-petclinic  && \
     git checkout ${BRANCH} && \
     mvn package

FROM openjdk:11
LABEL project="petclinic"
LABEL author="me"
EXPOSE 8080
COPY  --from=build /spring-petclinic/target/spring-petclinic-2.7.3.jar /spring-petclinic-2.7.3.jar
CMD ["java","-jar","spring-petclinic-2.7.3.jar"]     