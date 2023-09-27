# Stage 1: Build the application with Maven
FROM  openjdk:19-jdk-alpine3.16 as builder
WORKDIR /app1
#copy all file to the directory
COPY .  /app1
#install dependencies
RUN ./mvnw clean install test


FROM openjdk:17-alpine 
WORKDIR /app2
COPY --from=builder /app1/target/spring-petclinic-3.1.0-SNAPSHOT.jar /app2/*.jar
ENTRYPOINT ["java", "-jar", "/app2/*.jar" ]

