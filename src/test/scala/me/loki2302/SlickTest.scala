package me.loki2302

import org.junit.Test

import scala.slick.lifted.Tag
import scala.slick.driver.HsqldbDriver.simple._
import org.junit.Assert._

class SlickTest {

  @Test
  def canUseSlick(): Unit = {
    class Notes(tag: Tag) extends Table[(Int, String)](tag, "Notes") {
      def id = column[Int]("Id", O.PrimaryKey)
      def content = column[String]("Content")
      def * = (id, content)
    }
    val notes = TableQuery[Notes]

    Database.forURL("jdbc:hsqldb:mem:test", driver = "org.hsqldb.jdbc.JDBCDriver") withSession {
      implicit session =>
        notes.ddl.create

        notes += (1, "first")
        notes += (2, "second")
        notes ++= Seq(
          (3, "third"),
          (4, "fourth"),
          (5, "fifth")
        )

        notes.insert((6, "sixth"))
        notes.insert((7, "seventh"))

        val numberOfNotes = notes.length.run
        assertEquals(7, numberOfNotes)

        val thirdNote = notes.filter(note => note.id === 3).first
        assertEquals(3, thirdNote._1)
        assertEquals("third", thirdNote._2)
    }
  }

}
