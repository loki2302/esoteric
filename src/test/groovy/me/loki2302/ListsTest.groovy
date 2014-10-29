package me.loki2302

import org.junit.Test

import static org.junit.Assert.*

class ListsTest {
    @Test
    void canHaveList() {
        def list = [2, 3, 4]
        assertTrue list instanceof List
        assertEquals 3, list.size()

        assertEquals 2, list.first()
        assertEquals 2, list[0]

        assertEquals 3, list[1]

        assertEquals 4, list.last()
        assertEquals 4, list[2]
    }

    @Test
    void canAddElementToList() {
        def list = [11, 22, 33, 44]
        list << 55
        assertEquals 5, list.size()
        assertEquals 55, list.last()
    }

    @Test
    void canGetASubList() {
        def list = [11, 22, 33, 44, 55]
        def subList = list[1..3]
        assertEquals 3, subList.size()
        assertEquals 22, subList[0]
        assertEquals 33, subList[1]
        assertEquals 44, subList[2]
    }

    @Test
    void canMapList() {
        def list = [11, 22, 33, 44, 55]
        def newList = list.collect { 2 * it }
        assertEquals 5, newList.size()
        assertEquals 2 * 11, newList[0]
        assertEquals 2 * 22, newList[1]
        assertEquals 2 * 33, newList[2]
        assertEquals 2 * 44, newList[3]
        assertEquals 2 * 55, newList[4]
    }

    @Test
    void canReduceList() {
        def list = [11, 22, 33, 44]
        def sum = list.inject(0, { acc, val -> acc + val })
        assertEquals 11 + 22 + 33 + 44, sum
    }

    @Test
    void canHavePermutations() {
        def list = [1, 2, 3]
        def permutations = list.permutations()
        assertEquals 6, permutations.size()
        assertTrue permutations.contains([1, 2, 3])
        assertTrue permutations.contains([1, 3, 2])
        assertTrue permutations.contains([2, 1, 3])
        assertTrue permutations.contains([2, 3, 1])
        assertTrue permutations.contains([3, 1, 2])
        assertTrue permutations.contains([3, 2, 1])
    }
}
