package me.loki2302

import org.junit.Test
import org.junit.Assert.assertEquals;

class AnonymousFunctionTest {
  @Test
  def canUseAnonymousFunction(): Unit = {
    val addOne = (x: Int) => x + 1
    assertEquals(3, addOne(2))
  }

  @Test
  def canUseAnonymousFunctionThatReturnsAnonymousFunction(): Unit = {
    val makeAdder = (x: Int) => (y: Int) => x + y
    val addOne = makeAdder(1)
    val result = addOne(2)
    assertEquals(3, result)
  }
}
