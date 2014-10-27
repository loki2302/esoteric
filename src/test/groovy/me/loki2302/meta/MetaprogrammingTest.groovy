package me.loki2302.meta

import org.codehaus.groovy.control.CompilePhase
import org.codehaus.groovy.tools.ast.TransformTestHelper
import org.junit.Test

import static org.junit.Assert.assertEquals

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

    @Test
    public void canUseASTTransformation() {
        def transformTestHelper = new TransformTestHelper(
                new PrependPrintlnASTTransformation(),
                CompilePhase.SEMANTIC_ANALYSIS);

        def dummyClass = transformTestHelper.parse('''

class Dummy {
    @me.loki2302.meta.PrependPrintln
    public void hello() {
        println 'I am hello method'
    }
}

''')

        def dummy = dummyClass.newInstance()
        dummy.hello()

        // TODO: how do I test it actually?
        // Says:
        // Applying AST transformation! (from PrependPrintlnASTTransformation)
        // I am AST transformation (from code added by PrependPrintlnASTTransformation)
        // I am hello method (from Dummy)
    }
}
