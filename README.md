# "Погнали"

Монорепозиторий платформы поиска и бронирования спортивных площадок.

## Состав репозитория

| Каталог | Назначение |
| --- | --- |
| `backend/` | Kotlin + Spring Boot API, фоновые задачи и интеграции |
| `frontend/` | мобильное приложение Flutter (iOS/Android) |
| `web/` | React-приложение для кабинета площадки и админ-панели |
| `docs/` | требования, архитектура, ADR, OpenAPI и инструкции эксплуатации |
| `infra/` | инфраструктурные манифесты и правила окружений |
| `.agents/` | общие сценарии работы для агентной разработки |

Правила работы находятся в [AGENTS.md](AGENTS.md). Более узкие правила лежат в
соответствующих каталогах и дополняют корневые.

## Быстрый старт

Требования: Docker, Flutter 3.47+, JDK 21 и Node.js 24+. Версии инструментов
зафиксированы в `mise.toml`.

Всё приложение (PostgreSQL, backend, web и web-сборка Flutter) в Docker:

```bash
cp .env.example .env
mise run up
```

Задача `up` выполняет `docker compose up -d -V --build --wait` и ждёт
готовности всех сервисов. Остановка с удалением данных базы: `mise run down`
(`docker compose down -v`).

Web: <http://localhost:3000>, Flutter web: <http://localhost:3001>, API:
<http://localhost:8080>.

Разработка с запуском приложений на хосте:

```bash
cp .env.example .env
docker compose up -d db

cd backend && ./gradlew bootRun
cd frontend && flutter run --dart-define=API_BASE_URL=http://localhost:8080
cd web && npm install && npm run dev
```

## Основные проверки

```bash
mise run check
mise run test
mise run e2e:prepare
```

Подробности: [локальная разработка](docs/operations/local-development.md) и
[E2E](docs/operations/e2e.md).

## Архитектурные документы

- [Архитектура backend](docs/architecture.md)
- [Архитектура frontend](docs/frontend-architecture.md)
- [Навигация по документации](docs/README.md)
- [OpenAPI](docs/api/src/openapi.yaml)
