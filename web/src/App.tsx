import { Navigate, Route, Routes } from 'react-router-dom'
import './App.css'

function WorkspaceHome() {
  return (
    <main className="shell">
      <section className="card">
        <span className="eyebrow">Погнали · кабинет площадки</span>
        <h1>Управление площадками и бронированиями</h1>
        <p>
          Каркас web-приложения готов. Первый рабочий модуль будет добавлен
          после утверждения сценария авторизации и ролей.
        </p>
      </section>
    </main>
  )
}

function App() {
  return (
    <Routes>
      <Route path="/" element={<WorkspaceHome />} />
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}

export default App
