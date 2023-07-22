# Stage 1: Build the Java application using Maven
FROM maven:latest AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

# Stage 2: Create the final Tomcat image and deploy the Java application
FROM tomcat:latest
COPY --from=build /app/target/my-java-webapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
