# syntax=docker/dockerfile:1.7
FROM debian:bookworm-slim AS build
ARG FLUTTER_VERSION=3.47.7
RUN apt-get update \
    && apt-get install --yes --no-install-recommends ca-certificates curl git unzip xz-utils \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --uid 10001 builder
USER builder
ENV FLUTTER_HOME=/home/builder/flutter \
    PUB_CACHE=/home/builder/.pub-cache \
    FLUTTER_SUPPRESS_ANALYTICS=true \
    CI=true
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"
RUN git clone --depth 1 --branch "${FLUTTER_VERSION}" https://github.com/flutter/flutter.git "${FLUTTER_HOME}" \
    && flutter config --no-analytics --no-cli-animations \
    && flutter precache --web --no-android --no-ios
WORKDIR /home/builder/app
COPY --chown=builder pubspec.yaml pubspec.lock ./
RUN flutter pub get --enforce-lockfile
COPY --chown=builder . .
ARG API_BASE_URL=
RUN flutter build web --release --dart-define=API_BASE_URL="${API_BASE_URL}"

FROM nginxinc/nginx-unprivileged:1.29-alpine
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /home/builder/app/build/web /usr/share/nginx/html
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s --retries=6 \
    CMD wget --quiet --spider http://127.0.0.1:8080/healthz || exit 1
