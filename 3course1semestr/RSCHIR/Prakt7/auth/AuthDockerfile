FROM gradle:latest AS builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build
FROM openjdk:17
COPY --from=builder /home/gradle/src/build/libs/auth-1.0.0.jar /app/auth.jar
EXPOSE 8087
ENTRYPOINT ["java", "-jar", "/app/auth.jar"]