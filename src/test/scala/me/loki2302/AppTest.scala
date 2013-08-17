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

  test("can use constructor") {
    class Greeter(messageTemplate: String) {
      def sayHi(name: String): String = String.format(messageTemplate, name)
    }

    val greeter = new Greeter("hello %s")
    val greeting = greeter.sayHi("loki2302")
    assert(greeting == "hello loki2302")
    
    val greeting2 = greeter sayHi "loki2302"
    assert(greeting == "hello loki2302")
  }

  test("can use short syntax for lambdas") {
    val add = (a: Int, b: Int) => a + b
    val result = add(1, 2)
    assert(result == 3)
  }

  test("can use long syntax for lambdas") {
    val add = new Function2[Int, Int, Int] {
      def apply(a: Int, b: Int): Int = {
        return a + b
      }
    }

    val result = add(1, 2)
    assert(result == 3)
  }

  test("can use lambdas to return lambdas") {
    val plus = (y: Int) => (x: Int) => x + y
    val result = plus(1)(2)
    assert(result == 3)
  }

  test("can use pattern matching") {
    def testMatch(x: Any): Any = {
      val result = x match {
        case 1 => "one"
        case 2302 => "loki"
        case "loki" => 2302
        case _ => "something else"
      }

      assert(testMatch(1) == "one")
      assert(testMatch(2302) == "loki")
      assert(testMatch("loki") == 2302)
      assert(testMatch(3.14) == "something else")
    }
  }

  test("can use xml") {
    val myXml = 
    <doc>
      <item x="333">123</item>
    </doc>

    assert((myXml \\ "doc" \\ "item").text == "123")
    assert((myXml \\ "doc" \\ "item" \ "@x").text == "333")
  }

  test("can use for loops") {
    var s = 0
    for(i <- 1 to 3) {
      s += i
    }
    assert(s == 6)
  }

  test("can use closures") {
    var s = 0
    val adder = (i:Int) => s += i
    for(i <- 1 to 3) {
      adder(i)
    }
    assert(s == 6)
  }

  test("can iterate over array items") {
    val items = Array(1, 2, 3)
    var s = 0
    for(item <- items) {
      s += item
    }
    assert(s == 6)
  }
}