package pract24.task1;

public class test {
    public static void main(String[] args) {
        ConcreateComplexFactory factory = new ConcreateComplexFactory();
        Complex first = factory.createComplex();
        Complex second = factory.createComplex(5,3);
        System.out.println(first);
        System.out.println(second);
    }
}
