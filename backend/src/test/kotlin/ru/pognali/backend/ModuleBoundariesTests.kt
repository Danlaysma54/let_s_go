package ru.pognali.backend

import kotlin.test.Test
import org.springframework.modulith.core.ApplicationModules

class ModuleBoundariesTests {
    @Test
    fun `application modules have no forbidden dependencies`() {
        ApplicationModules.of(PognaliBackendApplication::class.java).verify()
    }
}
