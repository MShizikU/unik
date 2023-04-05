package task6.builder;

public class DirectorCar {

    public void createHisCar(Builder builder){
        builder.createWheels(true);
        builder.createCarcas(true);
        builder.createRoof(true);
    }
}
