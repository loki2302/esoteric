package main

import (
	"testing"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"net/http"
	"fmt"
	"time"
	"encoding/json"
	"context"
	"github.com/go-resty/resty"
	"bytes"
)

func Test(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "HTTP tests")
}

type MyResponse struct {
	RequestUrl string
	StringValue string `json:"sss"`
	IntValue int
}

var _ = Describe("HTTP", func() {
	var (
		server *http.Server
	)
	BeforeEach(func() {
		mux := http.NewServeMux()
		mux.Handle("/", http.HandlerFunc(func(response http.ResponseWriter, request *http.Request) {
			message := fmt.Sprintf("Current time is %s", time.Now())
			body := &MyResponse{
				RequestUrl: request.URL.Path,
				StringValue: message,
				IntValue: 123}

			encoder := json.NewEncoder(response)
			encoder.SetIndent("", "  ")
			encoder.Encode(body)
		}))

		server = &http.Server{Addr: ":8080", Handler: mux}
		go func() {
			server.ListenAndServe()
		}()

		// TODO: how do I make sure it's up?
		time.Sleep(100 * time.Millisecond)
	})

	AfterEach(func() {
		ctx, _ := context.WithTimeout(context.Background(), 1 * time.Second)
		server.Shutdown(ctx)
	})

	It("should work", func() {
		response, err := resty.R().Get("http://localhost:8080/")
		Expect(err).ToNot(HaveOccurred())
		Expect(response.StatusCode()).To(Equal(200))

		reader := bytes.NewReader(response.Body())
		decoder := json.NewDecoder(reader)
		var myResponse MyResponse
		decoder.Decode(&myResponse)
		Expect(myResponse.IntValue).To(Equal(123))
		Expect(myResponse.StringValue).To(ContainSubstring("Current time is"))
		Expect(myResponse.RequestUrl).To(Equal("/"))
	})
})
