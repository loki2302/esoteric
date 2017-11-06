package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

class OperatorOverloadingTest {
    static class Vector {
        double x
        double y

        Vector(double x, double y) {
            this.x = x
            this.y = y
        }

        // add vectors: a + b
        Vector plus(Vector other) {
            new Vector(x + other.x, y + other.y)
        }

        // dot product: a | b
        double or(Vector other) {
            x * other.x + y * other.y
        }
    }

    @Test
    void canAddVectors() {
        def a = new Vector(1, 0)
        def b = new Vector(0, 1)
        def c = a + b
        assertEquals 1.0, c.x, 0.001
        assertEquals 1.0, c.y, 0.001
    }

    @Test
    void canComputeDotProduct() {
        def a = new Vector(1, 0)
        def b = new Vector(0.5, 0.5)
        def projection = a | b
        assertEquals 0.5, projection, 0.001
    }
}
