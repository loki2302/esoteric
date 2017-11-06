package me.loki2302

import org.junit.Test
import org.junit.Assert._

class TraitsTest {
  @Test
  def canUseObjectViaTraits(): Unit = {
    val person = new Person("loki2302", 50)

    val hasName: HasName = person
    assertEquals("loki2302", hasName.getName())
    assertEquals("loki2302!", hasName.getNameWithExclamationMark())

    val hasAge: HasAge = person
    assertEquals(50, hasAge.getAge())
  }

  trait HasName {
    def getName(): String
    def getNameWithExclamationMark(): String = getName() + "!"
  }

  trait HasAge {
    def getAge(): Int
  }

  class Person(name: String, age: Int) extends HasName with HasAge {
    override def getName(): String = name
    override def getAge(): Int = age
  }
}
