# Локальная разработка

## Подготовка

```bash
cp .env.example .env
mise install
mise run bootstrap
docker compose up -d db
```

Официальный PostGIS-образ выбранной версии не имеет ARM64-манифеста. В примере
окружения задан `DOCKER_PLATFORM=linux/amd64`; на Apple Silicon база запускается
через эмуляцию. Если появится проверенный multi-arch образ с той же версией
расширения, решение нужно зафиксировать отдельным обновлением инфраструктуры.

## Запуск всего приложения в Docker

```bash
mise run up
```

Задача `up` выполняет `docker compose up -d -V --build --wait` и ждёт
готовности всех сервисов. Остановка с удалением данных базы: `mise run down`
(`docker compose down -v`).

Поднимаются сервисы `db`, `backend`, `web` и `mobile-web`. Web-клиент собирается
в статику и отдаётся nginx на порту `WEB_PORT` (по умолчанию 3000); запросы
`/api/` nginx проксирует в `backend`. Backend также доступен напрямую на
`BACKEND_PORT`.

Сервис `mobile-web` собирает Flutter-приложение под web (`flutter build web`) и
отдаёт его nginx на порту `MOBILE_WEB_PORT` (по умолчанию 3001). Запросы `/api/`
также проксируются в `backend`. По умолчанию `API_BASE_URL` при сборке пустой, и
клиент обращается к API своего же origin. Другой адрес задаётся переменной
`MOBILE_WEB_API_BASE_URL` и требует пересборки образа. Версия Flutter в образе
задаётся аргументом `FLUTTER_VERSION` в `frontend/Dockerfile` и должна совпадать
с версией разработчиков.

Web-сборка Flutter нужна для локального просмотра и ручной проверки. Целевыми
платформами клиентского приложения остаются iOS и Android, их по-прежнему
запускают на эмуляторе или устройстве.

Остановка с сохранением данных базы: `docker compose down`.

## Запуск приложений на хосте

Для разработки с hot reload поднимите только базу (`docker compose up -d db`), а
приложения запускайте локально.

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

Для Android Emulator вместо `localhost` обычно нужен `10.0.2.2`. iOS Simulator
использует `localhost`.

Web:

```bash
cd web
npm run dev
```

## Проверка доступности

```bash
curl http://localhost:8080/api/v1/system/ping
curl http://localhost:8080/actuator/health
curl http://localhost:3000/api/v1/system/ping
curl http://localhost:3001/api/v1/system/ping
```
