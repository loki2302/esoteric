package me.loki2302;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class EmbeddingTest {
    @Test
    public void dummy() {
        Binding binding = new Binding();
        binding.setVariable("foo", 2);

        GroovyShell groovyShell = new GroovyShell(binding);
        Object result = groovyShell.evaluate("return foo + 3");
        assertEquals(5, (int)(Integer)result);
    }
}
