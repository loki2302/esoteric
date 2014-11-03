package me.loki2302

import org.junit.Test

import static org.junit.Assert.*

class XmlSlurperTest {
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
}
