package pract7.task7_8;

public interface Printable {

    public default void print(){
        System.out.println("Author: ****\nyear: ****\nsummary:\n");
    }

}
