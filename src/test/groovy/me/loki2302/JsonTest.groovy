package me.loki2302

import groovy.json.JsonSlurper
import org.junit.Test

import static org.junit.Assert.*

class JsonTest {
    @Test
    void canParseJson() {
        def jsonSlurper = new JsonSlurper()
        def obj = jsonSlurper.parseText('''
{
    "name": "loki2302",
    "age": 30,
    "interests": ["java", "groovy"]
}
''')

        assertTrue obj instanceof Map
        assertEquals 'loki2302', obj.name
        assertEquals 30, obj.age
        assertTrue obj.interests instanceof List
        assertEquals 'java', obj.interests[0]
        assertEquals 'groovy', obj.interests[1]
    }
}
