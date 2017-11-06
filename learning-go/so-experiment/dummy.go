package main

import (
  "C"
  "log"
)

func init() {
  log.Println("LOADED!!!111")
}

//export doSomething
func doSomething(a int) int {
  log.Printf("Omg! The number is %d!", a)
  return a * 2
}

func main() {}
