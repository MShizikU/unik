package task7.FlyWieght;

public class Car {
    private String color;
    private String model;

    public Car(String color, String model) {
        this.color = color;
        this.model = model;
    }

    public void move(int[] cords, int speed, String serialNumber){
        System.out.println("We moved: "  + cords + " " + speed  + " " + serialNumber );
    }
}
