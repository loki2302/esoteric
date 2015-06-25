package me.loki2302

import org.junit.Test
import org.junit.Assert._

class LoopsTest {
  @Test
  def canUseForLoop(): Unit = {
    assertEquals(15, (() => {
      var sum = 0
      for (i <- 0 to 5) {
        sum += i
      }
      sum
    })());

    assertEquals(10, (() => {
      var sum = 0
      for (i <- 0 until 5) {
        sum += i
      }
      sum
    })());
  }
}
