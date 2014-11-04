package me.loki2302

import groovy.xml.MarkupBuilder
import org.junit.Test

import static org.junit.Assert.*

class XmlTest {
    @Test
    void canParseXml() {
        def xmlSlurper = new XmlSlurper()
        def obj = xmlSlurper.parseText('''
<person age="30">
    <name>loki2302</name>
    <interests>
        <interest>java</interest>
        <interest>groovy</interest>
    </interests>
</person>
''')

        assertEquals 'person', obj.name()
        assertEquals '30', obj.@age.text()
        assertEquals 'loki2302', obj.name.text()
        assertEquals 2, obj.interests.interest.size()
        assertEquals 'java', obj.interests.interest[0].text()
        assertEquals 'groovy', obj.interests.interest[1].text()
    }

    @Test
    void canWriteXml() {
        def stringWriter = new StringWriter()
        def builder = new MarkupBuilder(stringWriter)
        builder.setDoubleQuotes(true)
        builder.person(age: 30) {
            name 'loki2302'
            interests {
                interest 'java'
                interest 'groovy'
            }
        }

        def xml = stringWriter.toString()
        assertEquals '''\
<person age="30">
  <name>loki2302</name>
  <interests>
    <interest>java</interest>
    <interest>groovy</interest>
  </interests>
</person>\
''', xml
    }
}
