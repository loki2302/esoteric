package me.loki2302.meta

public class AnyMethod {
    def methodMissing(String name, args) {
        name
    }
}
