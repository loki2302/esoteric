package me.loki2302;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;
import groovy.lang.Script;
import org.codehaus.groovy.control.CompilerConfiguration;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class EmbeddingTest {
    @Test
    public void canRunGroovyAtRuntime() {
        Binding binding = new Binding();
        binding.setVariable("foo", 2);

        GroovyShell groovyShell = new GroovyShell(binding);
        Object result = groovyShell.evaluate("return foo + 3");
        assertEquals(5, (int)(Integer)result);
    }

    @Test
    public void canUseBaseScriptClass() {
        List<Integer> list = new ArrayList<Integer>();

        CompilerConfiguration compilerConfiguration = new CompilerConfiguration();
        compilerConfiguration.setScriptBaseClass(MyScriptBase.class.getName());

        Binding binding = new Binding();
        binding.setVariable("list", list);

        GroovyShell groovyShell = new GroovyShell(binding, compilerConfiguration);
        groovyShell.evaluate("add 123; add 222");

        assertEquals(2, list.size());
        assertEquals(123, (int)list.get(0));
        assertEquals(222, (int)list.get(1));
    }

    public static abstract class MyScriptBase extends Script {
        void add(int x) {
            List<Integer> list = (List<Integer>)getBinding().getVariable("list");
            list.add(x);
        }
    }
}
