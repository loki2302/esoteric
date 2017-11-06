package me.loki2302

data class Person(val firstName: String, val lastName: String)

fun main(args: Array<String>) {
    System.out.println("Hell world")

    val p = Person("John", "Smith")
    System.out.println(p)

    val (fn, ln) = p
    System.out.println(fn)
    System.out.println(ln)

    val p2: Person
    p2 = p
    printPerson(p2)

    val items: IntArray = intArrayOf(1, 2, 3, 4, 5)
    System.out.println(items
            .filter { it % 2 == 0 }
            .map { 2 * it })
}

fun printPerson(p: Person) = System.out.println(p)