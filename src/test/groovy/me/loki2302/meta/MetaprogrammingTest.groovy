package me.loki2302.meta

import org.junit.Test
import static org.junit.Assert.*

public class MetaprogrammingTest {
    @Test
    public void canHandleMethodCallsDynamically() {
        def anyMethod = new AnyMethod()
        assertEquals 'hello', anyMethod.hello()
    }
}
