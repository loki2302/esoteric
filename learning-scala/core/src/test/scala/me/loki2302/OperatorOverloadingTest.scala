package me.loki2302

import org.junit.Assert._
import org.junit.Test

class OperatorOverloadingTest {
  val Tolerance = 0.001

  @Test
  def canUseAdd(): Unit = {
    val a = new Vector(1, 2)
    val b = new Vector(3, 4)
    val c = a + b

    assertEquals(4, c.x, Tolerance)
    assertEquals(6, c.y, Tolerance)
  }

  @Test
  def canUseSub(): Unit = {
    val a = new Vector(1, 2)
    val b = new Vector(3, 4)
    val c = a - b

    assertEquals(-2, c.x, Tolerance)
    assertEquals(-2, c.y, Tolerance)
  }
}

class Vector(val x: Double, val y: Double) {
  def +(that: Vector) = new Vector(x + that.x, y + that.y)
  def -(that: Vector) = new Vector(x - that.x, y - that.y)
}
