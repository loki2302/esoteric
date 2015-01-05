package me.loki2302

import org.junit.Test
import org.junit.Assert.assertEquals
import scala.language.experimental.macros
import me.loki2302.Macros._

class MacrosTest {
  @Test
  def canUseScalaMacros(): Unit = {
    val a = 2;
    val result = printParam(a + 3)
    assertEquals("a.+(3) = 5", result);
  }
}
