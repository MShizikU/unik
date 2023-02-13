package pract6.task6_9;

public interface Printable {

    public default void print(){
        System.out.println("Author: ****\nyear: ****\nsummary:\n");
    }

}
