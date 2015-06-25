package me.loki2302

import scala.language.experimental.macros
import scala.reflect.macros.whitebox.Context

object Macros {
  def printParam(param: Any): String = macro printParamImpl

  def printParamImpl(c: Context)(param: c.Expr[Any]): c.Expr[String] = {
    import c.universe._
    val paramRep = show(param.tree)
    val paramRepTree = Literal(Constant(paramRep))
    val paramRepExpr = c.Expr[String](paramRepTree)
    reify { paramRepExpr.splice + " = " + param.splice }
  }
}
