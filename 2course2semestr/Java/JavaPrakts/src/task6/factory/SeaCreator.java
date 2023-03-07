package task6.factory;

public class SeaCreator extends Factory{
    @Override
    protected Transport createTransport() {
        return new SeaTransport();
    }
}
