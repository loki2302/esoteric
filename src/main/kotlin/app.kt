package me.loki2302

data class Person(val firstName: String, val lastName: String)

fun main(args: Array<String>) {
    System.out.println("Hell world")

    val p = Person("John", "Smith")
    System.out.println(p)
}
