package me.loki2302

import groovy.text.markup.MarkupTemplateEngine
import groovy.text.markup.TemplateConfiguration
import org.junit.Test

import static org.junit.Assert.*

class MarkupTemplateEngineTest {
    @Test
    void canUseMarkupTemplateEngine() {
        def templateConfiguration = new TemplateConfiguration()
        def templateEngine = new MarkupTemplateEngine(templateConfiguration)
        def template = templateEngine.createTemplate '''
html {
    head {
        title(myTitle)
    }

    body {
        p(myText)
    }
}
'''
        def binding = [
                myTitle: 'hello',
                myText: 'there'
        ]
        def result = template.make(binding).toString()
        assertEquals '<html><head><title>hello</title></head><body><p>there</p></body></html>', result
    }
}
