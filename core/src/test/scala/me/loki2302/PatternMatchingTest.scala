package me.loki2302

import org.junit.Test
import org.junit.Assert._

class PatternMatchingTest {
  @Test
  def canCompareCaseClassObjects(): Unit = {
    assertEquals(Variable("a"), Variable("a"))
    assertNotEquals(Variable("a"), Variable("b"))
    assertNotEquals(Variable("a"), IntLiteral(123))
  }

  @Test
  def canUsePatternMatchingWithCaseClasses(): Unit = {
    assertEquals("variable-a", describe(Variable("a")))
    assertEquals("intliteral-123", describe(IntLiteral(123)))
    assertEquals("intliteral222", describe(IntLiteral(222)))
    assertEquals("variable-a-plus-intliteral-123", describe(Add(Variable("a"), IntLiteral(123))))
  }

  abstract class Expr
  case class Variable(name: String) extends Expr
  case class IntLiteral(value: Int) extends Expr
  case class Add(left: Expr, right: Expr) extends Expr

  private def describe(expr: Expr): String = expr match {
    case Variable(name) => "variable-" + name
    case IntLiteral(222) => "intliteral222"
    case IntLiteral(value) => "intliteral-" + value
    case Add(left, right) => describe(left) + "-plus-" + describe(right)
  }
}
