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

  @Test
  def canComposeFunctions(): Unit = {
    val addOne = (x: Int) => x + 1
    val mulByTwo = (x: Int) => x * 2

    val mulByTwoAndThenAddOne = addOne.compose(mulByTwo)
    assertEquals(3, mulByTwoAndThenAddOne(1)) // ((x * 2) + 1)

    val addOneAndThenMulByTwo = addOne.andThen(mulByTwo)
    assertEquals(4, addOneAndThenMulByTwo(1)) // ((x + 1) * 2)
  }

  @Test
  def canUseCurrying(): Unit = {
    val add = (x: Int, y: Int) => x + y
    val addOne = add.curried(1)
    assertEquals(3, addOne(2))
  }

  @Test
  def canSupplyArgumentsAsTuple(): Unit = {
    val add = (x: Int, y: Int) => x + y
    assertEquals(3, add.tupled((1, 2)))
  }
}
