# Мобильное приложение

Flutter-клиент для iOS и Android. Web-сборка используется для локального
просмотра в Docker (сервис `mobile-web` в корневом `compose.yml`).

```bash
flutter pub get
flutter run --dart-define=API_BASE_URL=http://localhost:8080
flutter analyze
flutter test
```

Интеграционные тесты и адреса для эмуляторов описаны в
[`../docs/operations/e2e.md`](../docs/operations/e2e.md).
