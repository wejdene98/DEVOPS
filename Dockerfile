FROM openjdk:17-jdk-alpine AS builder
WORKDIR /app
COPY pom.xml .
COPY src src
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/target/*.jar ./app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
