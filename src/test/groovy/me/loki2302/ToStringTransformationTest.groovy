package me.loki2302

import groovy.transform.ToString
import org.junit.Test

import static org.junit.Assert.*;

public class ToStringTransformationTest {
    @Test
    public void canUseToStringTransformation() {
        def person = new PersonWithSimpleToString(id: 123, name: 'loki2302')
        String s = person.toString()
        assertEquals ToStringTransformationTest.class.getName() + '$PersonWithSimpleToString(123, loki2302)', s
    }

    @ToString
    public static class PersonWithSimpleToString {
        int id
        String name
    }
}
