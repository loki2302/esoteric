package me.loki2302;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AppTest {
    @Test
    public void canRunApp() {
        App.main(null);
    }

    @Test
    public void canUseCalculator() {
        Calculator calculator = new Calculator();
        assertEquals(5, calculator.add(2, 3));
    }

    @Test
    public void canUseStatefulCalculator() {
        StatefulCalculator statefulCalculator = new StatefulCalculator(2);
        assertEquals(5, statefulCalculator.add(3));
    }
}
