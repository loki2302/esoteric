package me.loki2302

import org.junit.Test
import org.junit.Assert.assertEquals

class StringInterpolationTest {
  @Test
  def canUseStringInterpolation(): Unit = {
    val secret = 2302
    val username = s"loki$secret"
    val message = s"hello, $username!"
    assertEquals("hello, loki2302!", message)
  }

  @Test
  def canUseFormattingInterpolation(): Unit = {
    val secret = 2302
    val username = f"loki$secret%d"
    val message = f"hello, $username%s!"
    assertEquals("hello, loki2302!", message)
  }
}
