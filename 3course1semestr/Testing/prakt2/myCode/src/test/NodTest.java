package test;

import main.ClassForTest;
import org.junit.Assert;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class NodTest {

    @Test
    @DisplayName("Check nod basic correctness")
    void basicTestNod() {
        int actualNod = ClassForTest.NOD(33, 44);
        Assert.assertEquals(actualNod, 11);
    }

    @Test
    @DisplayName("Check nod equal correctness")
    void equalTestNod() {
        int actualNod = ClassForTest.NOD(11, 11);
        Assert.assertEquals(actualNod, 11);
    }

    @Test
    @DisplayName("Check nod b > a correctness")
    void orderTestNod() {
        int actualNod = ClassForTest.NOD(12, 4);
        Assert.assertEquals(actualNod, 4);
    }

    @Test
    @DisplayName("Check nod is one correctness")
    void oneTestNod() {
        int actualNod = ClassForTest.NOD(121, 131);
        Assert.assertEquals(actualNod, 1);
    }
}