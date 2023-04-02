package task6.AbstractFactory;

public class RussianCarFactory implements AbstractCarFactory{
    @Override
    public Car createCar() {
        return new RussianCar();
    }

    @Override
    public House createHouse() {
        return new RussianHouse();
    }
}
