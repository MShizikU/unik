package task6.factory;

public class RoadCreator extends Factory {
    @Override
    protected Transport createTransport() {
        return new RoadTransport();
    }
}
