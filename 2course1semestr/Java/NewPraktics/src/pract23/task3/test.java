package pract23.task3;

import pract23.task3.TrippleExpression;

public class test {
    public static void main(String[] args) {
        TrippleExpression expr = new Substract(new Multiply(new Const(2), new Variable("x")), new Const(3));
        System.out.println(new Substract(new Const(5), new Const(10)).evaluate(5,0,0));
        System.out.println(expr.evaluate(5, 0 , 0));
    }
}
