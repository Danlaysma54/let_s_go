# E2E-тестирование

E2E запускается против отдельного набора контейнеров и не использует локальную dev-базу.

## Запуск окружения

```bash
cp .env.e2e.example .env.e2e
mise run e2e:prepare
```

Для полного backend smoke-теста с автоматической очисткой окружения:

```bash
mise run e2e:backend
```

## Flutter integration test

Выберите запущенный симулятор или устройство:

```bash
cd frontend
flutter devices
flutter test integration_test --dart-define=API_BASE_URL=http://localhost:58080
```

Адрес backend зависит от платформы устройства. Для Android Emulator укажите `http://10.0.2.2:58080`.

## Завершение

```bash
mise run e2e:down
```

Тесты должны сами создавать уникальные данные и не зависеть от порядка выполнения. Артефакты падений сохраняются в `artifacts/`, но не коммитятся.
