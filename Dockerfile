# Builder stage
FROM openjdk:17-jdk-alpine AS builder

# Install Maven and other necessary packages
RUN apk add --no-cache maven

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src src

# Build the project
RUN mvn clean install -DskipTests

# Final stage
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar ./app.jar

# Expose the port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]

