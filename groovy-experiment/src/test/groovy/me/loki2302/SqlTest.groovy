package me.loki2302
import groovy.sql.Sql
import org.junit.After
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.assertEquals
import static org.junit.Assert.fail

class SqlTest {
    Sql sql

    @Before
    void setUpSql() {
        def databaseName = UUID.randomUUID().toString()
        sql = Sql.newInstance("jdbc:hsqldb:mem:$databaseName", 'sa', '', 'org.hsqldb.jdbc.JDBCDriver')
    }

    @After
    void destroySql() {
        sql.close()
    }

    @Test
    void canUseSql() {
        sql.execute '''
create table Notes(
    id int identity primary key,
    content varchar(100) not null)
'''
        (1..10).each {
            def content = 'hello there ' + it
            sql.execute "insert into Notes(content) values($content)"
        }

        def notes = sql.rows 'select id, content from Notes'
        assertEquals 10, notes.size()

        def firstNote = notes.first()
        assertEquals 0, firstNote.id
        assertEquals 'hello there 1', firstNote.content
    }

    @Test
    void canInsertAndGetGeneratedKey() {
        sql.execute '''
create table Notes(
    id int identity primary key,
    content varchar(100) not null)
'''

        def noteId = sql.executeInsert('''
insert into Notes(content)
values(?)
''', ['hello there']).first().first()

        def note = sql.firstRow("select id, content from Notes where id = $noteId")
        assertEquals noteId, note.id
        assertEquals 'hello there', note.content
    }

    @Test
    void canUseTransactions() {
        sql.execute '''
create table Notes(
    id int identity primary key,
    content varchar(100) not null)
'''

        try {
            sql.withTransaction {
                sql.executeInsert('''
insert into Notes(content)
values(?)
''', ['hello there']).first().first()

                def noteCount = sql.firstRow('select count(id) as noteCount from Notes').noteCount
                assertEquals 1, noteCount

                throw new RuntimeException('rollback')
            }

            fail()
        } catch (RuntimeException e) {
            assertEquals 'rollback', e.message

            def noteCount = sql.firstRow('select count(id) as noteCount from Notes').noteCount
            assertEquals 0, noteCount
        }
    }
}
