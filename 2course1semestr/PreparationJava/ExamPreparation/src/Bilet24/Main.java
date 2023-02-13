package Bilet24;

public class Main {
    public static void main(String[] args) {
        NumberFactory factory = new NumberFactory();
        factory.createNumber(NumberType.COMPLEX).useNumber();
        factory.createNumber(NumberType.RATIONAL).useNumber();
    }
}
