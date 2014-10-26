package me.loki2302

import org.junit.Test

import static org.junit.Assert.*

class ListsTest {
    @Test
    public void canHaveList() {
        def list = [2, 3, 4]
        assertTrue list instanceof List
        assertEquals 3, list.size()

        assertEquals 2, list.first()
        assertEquals 2, list[0]

        assertEquals 3, list[1]

        assertEquals 4, list.last()
        assertEquals 4, list[2]

        list.add(123)
        assertEquals 4, list.size()
        assertEquals 123, list.last()
        assertEquals 123, list[3]

        def sublist = list[1..3]
        assertEquals 3, sublist.size()
        assertEquals 3, sublist.first()
        assertEquals 123, sublist.last()
    }
}
