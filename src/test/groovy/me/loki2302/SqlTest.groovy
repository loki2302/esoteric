package me.loki2302

import groovy.sql.Sql
import org.junit.Test

import static org.junit.Assert.*

class SqlTest {
    @Test
    void canUseSql() {
        def sql = Sql.newInstance('jdbc:hsqldb:mem:test', 'sa', '', 'org.hsqldb.jdbc.JDBCDriver')
        sql.execute '''
create table Notes(
    id integer not null,
    content varchar(100) not null)
'''
        def id = 1
        def content = 'hello there'
        sql.execute "insert into Notes(id, content) values($id, $content)"

        def rows = sql.rows 'select id, content from Notes'
        assertEquals 1, rows.size()

        def firstRow = rows.first()
        assertEquals 1, firstRow.id
        assertEquals 'hello there', firstRow.content
    }
}
