package me.loki2302.meta

import org.junit.Test
import static org.junit.Assert.*

public class MetaprogrammingTest {
    @Test
    public void canHandleMethodCallsDynamically() {
        def anyMethod = new AnyMethod()
        assertEquals 'hello', anyMethod.hello()
    }

    @Test
    public void canHandlePropertyAccessDynamically() {
        def anyProperty = new AnyProperty()
        anyProperty.x = 123
        anyProperty.s = 'qwerty'

        assertEquals 123, (int)anyProperty.x
        assertEquals 'qwerty', anyProperty.s
    }
}
