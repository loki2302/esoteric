import ctypes
dummy = ctypes.CDLL("./libdummy.so")
result = dummy.doSomething(123)
print "result is %s" % result


