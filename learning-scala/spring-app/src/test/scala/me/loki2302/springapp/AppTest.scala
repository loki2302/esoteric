package me.loki2302.springapp

import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.boot.test.{SpringApplicationConfiguration, IntegrationTest}
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner
import org.springframework.test.context.web.WebAppConfiguration
import org.springframework.web.client.RestTemplate
import org.junit.Assert._

@RunWith(classOf[SpringJUnit4ClassRunner])
@SpringApplicationConfiguration(classes = Array(classOf[Config]))
@WebAppConfiguration
@IntegrationTest
class AppTest {
  @Test
  def dummy() : Unit = {
    val restTemplate: RestTemplate = new RestTemplate
    val result = restTemplate.getForObject("http://localhost:8080/", classOf[String])
    assertEquals("hello", result)
  }
}
