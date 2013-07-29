package me.loki2302

import org.scalatest.FunSuite

class AppTest extends FunSuite {
  test("one plus two is three") {
    assert(1 + 2 == 3)
  }

  test("can use objects") {
    object Calculator {
      def add(a: Int, b: Int): Int = {
        return a + b
      }
    }

    assert(Calculator.add(1, 2) == 3)
  }

  test("can use classes") {
    class Calculator {
      def add(a: Int, b: Int): Int = {
        return a + b
      }
    }

    val calculator = new Calculator()
    assert(calculator.add(1, 2) == 3)
  }
}