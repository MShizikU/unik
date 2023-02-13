package pract6.task4;

public interface Priceable {
    public default String getPrice(){
        return "0.0";
    }
}
