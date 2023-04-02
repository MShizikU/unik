package task6.builder;

public class TestBuilder {
    public static void main(String[] args) {
        DirectorCar car = new DirectorCar();
        CarBuilder builder = new CarBuilder();
        car.createHisCar(builder);
        System.out.println(builder.getResult());
    }
}
