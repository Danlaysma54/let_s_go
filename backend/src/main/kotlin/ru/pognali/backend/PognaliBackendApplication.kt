package ru.pognali.backend

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class PognaliBackendApplication

fun main(args: Array<String>) {
	runApplication<PognaliBackendApplication>(*args)
}
