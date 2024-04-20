# Builder stage
FROM openjdk:17-jdk-alpine AS builder

COPY pom.xml .
COPY src src
RUN mvn clean install -DskipTests
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/target/*.jar ./app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]COPY pom.xml .
COPY src src
RUN mvn clean install -DskipTests
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/target/*.jar ./app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

