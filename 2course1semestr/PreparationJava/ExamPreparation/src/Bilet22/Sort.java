package Bilet22;

import java.util.Arrays;
import java.util.Comparator;

public class Sort {
    public static <T extends Comparable<T>> void sort(T[] array){
        boolean sorted = false;
        T temp;
        while(!sorted) {
            sorted = true;
            for (int i = 0; i < array.length - 1; i++) {
                if (array[i].compareTo(array[i+1]) > 0) {
                    temp = array[i];
                    array[i] = array[i+1];
                    array[i+1] = temp;
                    sorted = false;
                }
            }
        }
        System.out.println(Arrays.toString(array));
    }
}
