package task6.builder;

public interface Builder {
    void createWheels(Boolean hasWheels);
    void createCarcas(Boolean hasCarcas);
    void createRoof(Boolean hasRoof);
    Car getResult();
}
