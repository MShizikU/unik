package pract3.task1.point2;

public class Main {
    public static void main(String[] args) {

        Tester testCircles = new Tester(10);

        System.out.println("Basic array: " + testCircles.toString());
        testCircles.sortCircles();

        System.out.println("Sorted array: " + testCircles.toString());
        System.out.println("Min circle: " + testCircles.minCircle().getRadius());
        System.out.println("Max circle: " + testCircles.maxCircle().getRadius());
        System.out.println("\n\n");

    }
}
