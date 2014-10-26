package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

public class ClosuresTest {
    @Test
    public void canModifyExternalScopeWithClosure() {
        def x = 0
        def closure = { x = 1 }

        closure()
        assertEquals 1, x
    }

    @Test
    public void canGetValueFromClosure() {
        def closure = { 123 }
        assertEquals 123, closure()
    }

    @Test
    public void canPassArgumentsToClosure() {
        def addNumbers = { int a, int b -> a + b }
        assertEquals 5, addNumbers(2, 3)
    }

    @Test
    public void canUseItToAccessTheOnlyArgument() {
        def twice = { 2 * it }
        assertEquals 10, twice(5)
    }

    @Test
    public void canUseCurrying() {
        def add = { a, b -> a + b }
        def addOne = add.curry(1)

        assertEquals 3, addOne(2)
    }
}
