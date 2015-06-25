package me.loki2302

object App {
  def main(args: Array[String]) {
    println("Hello world")

    val calculator = new Calculator()
    println(calculator.add(2, 3))

    val statefulCalculator1 = new StatefulCalculator(2)
    println(statefulCalculator1.add(3))
  }
}
