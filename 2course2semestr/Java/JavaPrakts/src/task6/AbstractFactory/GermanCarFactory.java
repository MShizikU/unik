package task6.AbstractFactory;

public class GermanCarFactory implements AbstractCarFactory{
    @Override
    public Car createCar() {
        return new GermanCar();
    }

    @Override
    public House createHouse(){
        return new GermanHouse();
    }
}
