package main

import (
	"testing"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"os"
)

type Note struct {
	gorm.Model
	Text string
}

func Test(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "GORM tests")
}

var _ = Describe("GORM", func() {
	var (
		db *gorm.DB
	)

	BeforeEach(func() {
		os.Remove("test.db")

		var err error
		db, err = gorm.Open("sqlite3", "test.db")
		Expect(err).NotTo(HaveOccurred())

		db.AutoMigrate(&Note{})
	})

	AfterEach(func() {
		db.Close()
	})

	It("should let me create a note", func() {
		note := Note{Text: "hello there"}
		db.Create(&note)
		Expect(note.ID).To(Equal(uint(1)))
	})

	Context("when there's a note", func() {
		var (
			noteId uint
		)
		BeforeEach(func() {
			note := Note{Text: "hello there"}
			db.Create(&note)
			noteId = note.ID
		})

		It("should let me count notes", func() {
			var count int
			db.Model(&Note{}).Count(&count)
			Expect(count).To(Equal(1))
		})

		It("should let me get that note", func() {
			var note Note
			db.First(&note, noteId)
			Expect(note.ID).To(Equal(noteId))
			Expect(note.Text).To(Equal("hello there"))
		})
	})
})
