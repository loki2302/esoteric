package me.loki2302

import org.junit.Test
import org.junit.Assert.assertEquals

class ScalaAppTest {
  @Test
  def canRunApp(): Unit = {
    App.main(null)
  }

  @Test
  def canUseCalculator(): Unit = {
    val calculator : Calculator = new Calculator
    assertEquals(5, calculator.add(2, 3))
  }

  @Test
  def canUseStatefulCalculator(): Unit = {
    val statefulCalculator : StatefulCalculator = new StatefulCalculator(2)
    assertEquals(5, statefulCalculator.add(3))
  }
}
