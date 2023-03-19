package task7.FlyWieght;

import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<MovingCar> UniqueCars = new ArrayList<MovingCar>();
        ArrayList<Car> RepeatedCars = new ArrayList<>();

        RepeatedCars.add(new Car("green", "tesla"));
        RepeatedCars.add(new Car("yellow", "volvo"));

        UniqueCars.add(new MovingCar(RepeatedCars.get(1), new int[]{10,10}, 10, "dh450d"));
        UniqueCars.add(new MovingCar(RepeatedCars.get(1), new int[]{25,13}, 24, "df450d"));
        UniqueCars.add(new MovingCar(RepeatedCars.get(1), new int[]{15,123}, 234, "ag450d"));

        UniqueCars.forEach(MovingCar::move);
    }
}
