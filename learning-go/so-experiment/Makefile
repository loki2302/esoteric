run:
	go build -buildmode=c-shared -o libdummy.so dummy.go
	nm -D libdummy.so | grep doSomething
	python app.py

clean:
	rm libdummy.so
	rm libdummy.h

