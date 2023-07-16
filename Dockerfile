# Use a base image with Java and Tomcat (you can choose a different base image if needed)
FROM tomcat:latest

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Copy the .war file from the local machine to the container's working directory
COPY java-web/target/*.war .

# Expose the port that Tomcat is listening on (usually 8080 by default)
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]
