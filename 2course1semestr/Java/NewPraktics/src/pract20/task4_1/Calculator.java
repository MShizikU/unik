package pract20.task4_1;

public class Calculator {

    public static <T extends Number, V extends Number> Double sum(T a, V b ){
        return a.doubleValue() + b.doubleValue();
    }

    public static <T extends Number, V extends Number> Double multiply(T a, V b){
        return a.doubleValue() * b.doubleValue();
    }

    public static <T extends Number, V extends Number> Double divide(T a, V b){
        return a.doubleValue() / b.doubleValue();
    }

    public static <T extends Number, V extends Number> Double subtraction(T a, V b){
        return a.doubleValue() - b.doubleValue();
    }

}
