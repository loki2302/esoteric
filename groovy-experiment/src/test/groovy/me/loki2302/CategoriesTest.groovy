package me.loki2302

import org.junit.Test
import static org.junit.Assert.*

class CategoriesTest {
    @Test
    void canUseCategories() {
        use(NumberCategory) {
            def beers = 10.getBeers()
            assertTrue beers instanceof BeerCount
            assertEquals 10, beers.value

            beers = 10.beers
            assertTrue beers instanceof BeerCount
            assertEquals 10, beers.value
        }
    }

    static class BeerCount {
        def value
    }

    static class NumberCategory {
        static BeerCount getBeers(Number self) {
            new BeerCount(value: self)
        }
    }
}
