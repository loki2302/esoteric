package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

public class TraitsTest {
    @Test
    public void canUseTraits() {
        def person = new Person()
        assertEquals 'loki2302', person.name()
        assertEquals 'My name is loki2302!', person.myNameIs()
        assertEquals 42, person.age()
    }

    // it looks like IDEA doesn't understand traits as of 13.1.5

    public static trait Name {
        abstract String name()
        String myNameIs() { "My name is ${name()}!" }
    }

    public static trait Age {
        int age() { 42 }
    }

    public static class Person implements Name, Age {
        String name() {
            "loki2302"
        }
    }
}
