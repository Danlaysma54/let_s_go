# syntax=docker/dockerfile:1.7
FROM eclipse-temurin:21-jdk AS build
WORKDIR /workspace
COPY gradle gradle
COPY gradlew build.gradle.kts settings.gradle.kts gradle.lockfile ./
RUN ./gradlew dependencies --no-daemon --console=plain >/dev/null
COPY src src
RUN ./gradlew bootJar --no-daemon

FROM eclipse-temurin:21-jre
RUN apt-get update \
    && apt-get install --yes --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --system --uid 10001 app
WORKDIR /app
COPY --from=build /workspace/build/libs/*.jar app.jar
USER app
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s --retries=12 \
    CMD curl --fail --silent http://localhost:8080/actuator/health || exit 1
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
