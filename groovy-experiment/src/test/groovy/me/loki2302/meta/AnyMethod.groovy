package me.loki2302.meta

class AnyMethod {
    def methodMissing(String name, args) {
        name
    }
}
