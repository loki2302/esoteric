package me.loki2302

import org.junit.Test;
import org.junit.Assert._;

class CollectionsTest {
  @Test
  def canDefineList(): Unit = {
    val list = List(11, 22, 33)
    assertEquals(11, list(0))
    assertEquals(22, list(1))
    assertEquals(33, list(2))
  }

  @Test
  def canMapList(): Unit = {
    val list = List(11, 22, 33).map(_ * 2)
    assertEquals(List(22, 44, 66), list)
  }

  @Test
  def canReduceList(): Unit = {
    val sum = List(11, 22, 33).reduce((s, v) => s + v)
    assertEquals(66, sum)
  }

  @Test
  def canFilterList(): Unit = {
    val list = List(11, 22, 33, 44).filter(_ % 2 == 0)
    assertEquals(List(22, 44), list)
  }

  @Test
  def canCheckIfExists(): Unit = {
    val atLeastOneEvenElementExists = List(11, 22, 33, 44).exists(_ % 2 == 0)
    assertTrue(atLeastOneEvenElementExists)
  }

  @Test
  def canCount(): Unit = {
    val count = List(11, 22, 33, 44).count(_ % 2 == 0)
    assertEquals(2, count)
  }
}
