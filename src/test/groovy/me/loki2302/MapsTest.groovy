package me.loki2302

import org.junit.Test

import static org.junit.Assert.*

class MapsTest {
    @Test
    void canHaveMap() {
        def map = [
                one: 1,
                two: 2,
                three: 3
        ]
        assertTrue map instanceof Map
        assertEquals 3, map.size()
        assertEquals 1, map['one']
        assertEquals 2, map['two']
        assertEquals 3, map['three']
    }
}