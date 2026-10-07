# Локальная разработка

## Подготовка

```bash
cp .env.example .env
mise install
mise run bootstrap
docker compose up -d db
```

Официальный PostGIS-образ выбранной версии не имеет ARM64-манифеста. В примере окружения задан `DOCKER_PLATFORM=linux/amd64`; на Apple Silicon база запускается через эмуляцию. Если появится проверенный multi-arch образ с той же версией расширения, решение нужно зафиксировать отдельным обновлением инфраструктуры.

## Запуск

Backend:

```bash
cd backend
./gradlew bootRun
```

Flutter:

```bash
cd frontend
flutter run --dart-define=API_BASE_URL=http://localhost:8080
```

Для Android Emulator вместо `localhost` обычно нужен `10.0.2.2`. iOS Simulator использует `localhost`.

Web:

```bash
cd web
npm run dev
```

## Проверка доступности

```bash
curl http://localhost:8080/api/v1/system/ping
curl http://localhost:8080/actuator/health
```
