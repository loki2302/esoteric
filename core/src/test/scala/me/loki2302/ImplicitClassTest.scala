package me.loki2302

import org.junit.Test
import org.junit.Assert.assertEquals

class ImplicitClassTest {
  @Test
  def canUseImplicitCalculator(): Unit = {
    val addResult: Int = 2 add 3
    assertEquals(5, addResult)

    val subResult: Int = 2 sub 3
    assertEquals(-1, subResult)
  }

  implicit class ImplicitCalculator(val x: Int) {
    def add(y: Int): Int = x + y
    def sub(y: Int): Int = x - y
  }
}
