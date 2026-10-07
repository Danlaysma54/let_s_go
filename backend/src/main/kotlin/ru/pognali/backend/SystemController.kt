package ru.pognali.backend

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

data class PingResponse(val status: String)

@RestController
@RequestMapping("/api/v1/system")
class SystemController {
    @GetMapping("/ping")
    fun ping(): PingResponse = PingResponse(status = "ok")
}
