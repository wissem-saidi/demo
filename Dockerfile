# Étape 1 : Construire l'application
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape 2 : Créer l'image exécutable
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.jar hello-world.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "hello-world.jar"]
