rm libdummy.so
go build -buildmode=c-shared -o libdummy.so dummy.go
nm -D libdummy.so | grep doSomething
python app.py
