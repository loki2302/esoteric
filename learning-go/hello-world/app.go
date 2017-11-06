package main

import "log"

func addNumbers(a int, b int) int {
  return a + b
}

func main() {
  log.Println("Hello World")

  twoAndThree := addNumbers(2, 3)
  log.Printf("2 + 3 is %d\n", twoAndThree)
}
