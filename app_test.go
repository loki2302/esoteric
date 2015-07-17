package main

import "testing"

func testAddNumbers(t *testing.T) {
  cases := []struct {
    a int
    b int
    sum int
  }{
    { 1, 2, 3 },
    { 2, 3, 5 },
    { 12, 13, 25 },
  }

  for _, kase := range cases {
    a := kase.a
    b := kase.b
    expectedSum := kase.sum
    actualSum := addNumbers(a, b)

    if actualSum != expectedSum {
      t.Errorf("addNumbers(%d, %d) is supposed to return %d, but it returned %d", a, b, expectedSum, actualSum)
    }
  }
}