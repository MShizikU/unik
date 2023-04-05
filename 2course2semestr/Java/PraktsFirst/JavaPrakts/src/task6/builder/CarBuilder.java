package task6.builder;

public class CarBuilder implements Builder{

    Car car = new Car();

    @Override
    public void createWheels(Boolean hasWheels) {
        car.setHasWheels(hasWheels);
    }

    @Override
    public void createCarcas(Boolean hasCarcas) {
        car.setHasCarcas(hasCarcas);
    }

    @Override
    public void createRoof(Boolean hasRoof) {
        car.setHasRoof(hasRoof);
    }

    @Override
    public Car getResult() {
        return car;
    }
}
