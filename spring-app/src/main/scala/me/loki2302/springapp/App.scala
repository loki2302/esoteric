package me.loki2302.springapp

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.web.bind.annotation.{RequestMapping, RestController}

object App {
  def main(args: Array[String]): Unit = {
    SpringApplication.run(classOf[Config], args : _*)
  }
}

@SpringBootApplication
class Config

@RestController
class HelloController {
  @RequestMapping(Array("/"))
  def index(): String = {
    return "hello"
  }
}
