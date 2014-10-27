package me.loki2302.meta

public class AnyProperty {
    def map = [:]

    def propertyMissing(String name, value) {
        map[name] = value
    }

    def propertyMissing(String name) {
        map[name]
    }
}
