package me.loki2302
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import org.junit.Test

import static org.junit.Assert.assertEquals
import static org.junit.Assert.assertTrue

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

    @Test
    void canWriteJson() {
        def builder = new JsonBuilder()
        def root = builder {
            name 'loki2302'
            age 30
            interests 'java', 'groovy'
        }

        def json = builder.toString()
        assertEquals '{"name":"loki2302","age":30,"interests":["java","groovy"]}', json
    }
}
