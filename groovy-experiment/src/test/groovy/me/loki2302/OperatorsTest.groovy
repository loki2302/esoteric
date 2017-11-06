package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

class OperatorsTest {
    @Test
    void canUseSpreadOperator() {
        def f = { int a, String s -> "${a}${s}".toString() }
        def args = [123, 'hello']
        def result = f(*args)
        assertEquals '123hello', result
    }
}
