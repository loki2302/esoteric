package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

class InterfaceImplementationsTest {
    @Test
    public void canUseClosureToImplementInterface() {
        I obj = { Object[] args -> "$args".toString() } as I

        assertEquals 'null', obj.func()
        assertEquals '[123]', obj.otherFunc(123)
    }

    @Test
    void canClosureMapToImplementInterface() {
        I obj = [
                func: { Object[] args -> 'func' },
                otherFunc: { Object[] args -> "otherFunc $args".toString() }
        ] as I

        assertEquals 'func', obj.func()
        assertEquals 'otherFunc [123]', obj.otherFunc(123)
    }

    interface I {
        String func()
        String otherFunc(int a)
    }
}
