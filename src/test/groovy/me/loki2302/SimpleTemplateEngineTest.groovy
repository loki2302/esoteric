package me.loki2302

import groovy.text.SimpleTemplateEngine
import org.junit.Test

import static org.junit.Assert.*

class SimpleTemplateEngineTest {
    @Test
    void canUseSimpleTemplateEngine() {
        def binding = [
                'username': 'loki2302'
        ]

        def engine = new SimpleTemplateEngine()
        def template = engine.createTemplate('Hello, <%= username %>!')
        def resultWritable = template.make(binding)

        def stringWriter = new StringWriter()
        resultWritable.writeTo(stringWriter)
        def resultFromStringWriter = stringWriter.toString()
        assertEquals 'Hello, loki2302!', resultFromStringWriter

        def resultFromToString = resultWritable.toString()
        assertEquals 'Hello, loki2302!', resultFromToString
    }
}
