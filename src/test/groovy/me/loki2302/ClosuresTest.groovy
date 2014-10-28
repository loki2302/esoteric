package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

class ClosuresTest {
    @Test
    void canModifyExternalScopeWithClosure() {
        def x = 0
        def closure = { x = 1 }

        closure()
        assertEquals 1, x
    }

    @Test
    void canGetValueFromClosure() {
        def closure = { 123 }
        assertEquals 123, closure()
    }

    @Test
    void canPassArgumentsToClosure() {
        def addNumbers = { int a, int b -> a + b }
        assertEquals 5, addNumbers(2, 3)
    }

    @Test
    void canUseItToAccessTheOnlyArgument() {
        def twice = { 2 * it }
        assertEquals 10, twice(5)
    }

    @Test
    void canUseCurrying() {
        def add = { a, b -> a + b }
        def addOne = add.curry(1)

        assertEquals 3, addOne(2)
    }

    @Test
    void canUseDelegate() {
        def closure = { add(2); add(3); }

        def list = []
        closure.delegate = list
        closure()

        assertEquals 2, list.size()
        assertEquals 2, list.first()
        assertEquals 3, list.last()
    }

    @Test
    void canUseMethodReference() {
        def list = []
        def addToList = list.&add
        addToList 123
        addToList 222
        assertEquals 2, list.size()
        assertEquals 123, list[0]
        assertEquals 222, list[1]
    }
}
