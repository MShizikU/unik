package task7.FlyWieght;

public class MovingCar {
    private Car car;
    private int[] cords;
    private int speed;
    private String serialNumber;

    public MovingCar(Car car, int[] coords, int speed, String serialNumber) {
        this.car = car;
        this.cords = coords;
        this.speed = speed;
        this.serialNumber = serialNumber;
    }

    public void move(){
        car.move(cords, speed, serialNumber);
    }
}
