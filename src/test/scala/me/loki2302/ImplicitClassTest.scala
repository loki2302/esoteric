package me.loki2302

import org.junit.Test
import org.junit.Assert.assertEquals

class ImplicitClassTest {
  @Test
  def canUseImplicitCalculator(): Unit = {
    val result : Int = 2 add 3
    assertEquals(5, result)
  }

  implicit class ImplicitCalculator(val x: Int) {
    def add(y: Int): Int = x + y
  }
}
