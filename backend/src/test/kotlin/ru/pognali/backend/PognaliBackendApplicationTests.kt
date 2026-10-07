package ru.pognali.backend

import kotlin.test.Test
import kotlin.test.assertEquals

class PognaliBackendApplicationTests {
    @Test
    fun `system ping returns stable public response`() {
        assertEquals(PingResponse(status = "ok"), SystemController().ping())
    }
}
