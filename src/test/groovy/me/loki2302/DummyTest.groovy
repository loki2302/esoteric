package me.loki2302

import clojure.lang.Compiler
import clojure.lang.RT
import clojure.lang.Var
import org.junit.Test

import static org.junit.Assert.assertEquals;

class DummyTest {
    @Test
    void canAddNumbers() {
        assertEquals(5, (Integer)clojure("""
(+ 2 3)
"""))
    }

    @Test
    void canDefineFunction() {
        clojure("""
(ns user)
(defn add [a b]
    (+ a b))
""")

        def add = RT.var("user", "add");
        assertEquals(5, (Integer)add.invoke(2, 3));
    }

    private static Object clojure(String s) {
        RT.load("clojure/core");
        Compiler.load(new StringReader(s));
    }
}
