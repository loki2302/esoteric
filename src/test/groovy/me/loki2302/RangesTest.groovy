package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

public class RangesTest {
    @Test
    public void canUseRange() {
        def range = 1..3

        assertTrue range instanceof List
        assertEquals 1, (int)range.from
        assertEquals 3, (int)range.to
        assertEquals 3, range.size()
        assertEquals 1, range[0]
        assertEquals 2, range[1]
        assertEquals 3, range[2]

        int iterationCount = 0
        for(i in range) {
            ++iterationCount
        }

        assertEquals 3, iterationCount

        iterationCount = 0
        range.each { ++iterationCount }

        assertEquals 3, iterationCount
    }
}
