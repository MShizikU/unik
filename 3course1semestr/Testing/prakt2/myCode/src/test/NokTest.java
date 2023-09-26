package test;

import main.ClassForTest;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.testng.Assert;

import static org.junit.jupiter.api.Assertions.*;

class NokTest {

    @Test
    @DisplayName("Basic nok test")
    void basicTestNok() {
        int actualNok = ClassForTest.NOK(4, 3);
        Assert.assertEquals(actualNok, 12);
    }

    @Test
    @DisplayName("Basic dif order nok test")
    void basicDifOrderTestNok() {
        int actualNok = ClassForTest.NOK(3, 4);
        Assert.assertEquals(actualNok, 12);
    }

    @Test
    @DisplayName("Equal nok test")
    void equalTestNok() {
        int actualNok = ClassForTest.NOK(4, 4);
        Assert.assertEquals(actualNok, 4);
    }

    @Test
    @DisplayName("Below zero A nok test")
    void belowZeroATestNok() {
        int actualNok = ClassForTest.NOK(-4, 3);
        Assert.assertEquals(actualNok, 12);
    }

    @Test
    @DisplayName("Below zero B nok test")
    void belowZeroBTestNok() {
        int actualNok = ClassForTest.NOK(4, -3);
        Assert.assertEquals(actualNok, 12);
    }

    @Test
    @DisplayName("Below zero A and B nok test")
    void belowZeroABTestNok() {
        int actualNok = ClassForTest.NOK(-4, -3);
        Assert.assertEquals(actualNok, 12);
    }

    @Test
    @DisplayName("Zero A nok test")
    void zeroATestNok() {
        int actualNok = ClassForTest.NOK(0, 3);
        Assert.assertEquals(actualNok, 0);
    }

    @Test
    @DisplayName("Zero B nok test")
    void zeroBTestNok() {
        int actualNok = ClassForTest.NOK(3, 0);
        Assert.assertEquals(actualNok, 0);
    }

    @Test
    @DisplayName("Zero A and B nok test")
    void zeroABTestNok() {
        int actualNok = ClassForTest.NOK(0, 0);
        Assert.assertEquals(actualNok, 0);
    }
}