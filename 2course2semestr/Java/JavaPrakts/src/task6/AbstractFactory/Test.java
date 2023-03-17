package task6.AbstractFactory;

public class Test {
    public static void main(String[] args) {
        AbstractCarFactory factory = new RussianCarFactory();
        Car car = factory.createCar();
        car.drive();
    }
}
