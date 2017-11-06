package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

class DslTest {

    static class Person {
        String name
        int age
        String comment

        static Person make(Closure closure) {
            Person person = new Person()
            closure.delegate = person
            closure()

            person
        }

        void name(String name) {
            this.name = name
        }

        void age(int age) {
            this.age = age
        }

        void comment(String comment) {
            this.comment = comment.trim()
        }
    }

    @Test
    void dummy() {

        def person = Person.make {
            name = 'loki2302' // direct field access
            age 40 // setter access

            comment '''
1. Drinks a lot of coffee
2. Drinks a lot of coffee
3. Drinks a lot of coffee
'''
        }

        assertEquals 'loki2302', person.name
        assertEquals 40, person.age
        assertEquals 2, person.comment.count('\n')

    }

}
