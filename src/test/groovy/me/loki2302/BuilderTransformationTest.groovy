package me.loki2302

import groovy.transform.builder.Builder
import org.junit.Test
import static org.junit.Assert.*

public class BuilderTransformationTest {
    @Test
    public void canUseBuilderTransformation() {
        Person person = Person.builder()
                .id(123)
                .name('loki2302')
                .build()

        assertEquals 123, person.id
        assertEquals 'loki2302', person.name
    }

    @Builder
    public static class Person {
        int id
        String name
    }
}
