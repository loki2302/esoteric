package me.loki2302;

class StatefulCalculator(initial: Int) {
  var current: Int = initial

  def add(x: Int): Int = {
    current += x
    return current
  }
}