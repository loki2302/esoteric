package me.loki2302

import org.junit.Test

import scala.slick.lifted.Tag
import scala.slick.driver.HsqldbDriver.simple._
import org.junit.Assert._

class SlickTest {

  @Test
  def canUseSlick(): Unit = {
    case class Note(id: Int, content: String)

    class Notes(tag: Tag) extends Table[Note](tag, "Notes") {
      def id = column[Int]("Id", O.PrimaryKey)
      def content = column[String]("Content")
      def * = (id, content) <> (Note.tupled, Note.unapply)
    }
    val notes = TableQuery[Notes]

    Database.forURL("jdbc:hsqldb:mem:test", driver = "org.hsqldb.jdbc.JDBCDriver") withSession {
      implicit session =>
        notes.ddl.create

        notes += Note(1, "first")
        notes += Note(2, "second")
        notes ++= Seq(
          Note(3, "third"),
          Note(4, "fourth"),
          Note(5, "fifth")
        )

        notes.insert(Note(6, "sixth"))
        notes.insert(Note(7, "seventh"))

        val numberOfNotes = notes.length.run
        assertEquals(7, numberOfNotes)

        val thirdNote = notes.filter(note => note.id === 3).first
        assertEquals(3, thirdNote.id)
        assertEquals("third", thirdNote.content)
    }
  }

}
