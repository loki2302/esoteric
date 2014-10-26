package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

public class StringsTest {
    @Test
    public void canHaveAString() {
        def s = 'hello'
        assertTrue s instanceof String
        assertEquals 'hello', s
    }

    @Test
    public void canHaveAMultilineString() {
        def s = '''\
Line one
Line two'''
        assertTrue s instanceof String
        assertEquals 1, s.count('\n')
    }

    @Test
    public void canHaveAGString() {
        def name = 'loki2302'
        def s = "Hi, ${name}!"
        assertTrue s instanceof GString
        assertEquals 'Hi, loki2302!', s.toString()

        name = 'omg'
        assertEquals 'Hi, loki2302!', s.toString()
    }
}
