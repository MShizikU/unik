package pract21.task2_3;


import java.util.Collections;

public class Test {


    public static void main(String[] args) {
        ArrayStorage<Integer> storage = new ArrayStorage<>();
        Integer[] ar = {1,2,3,4,5};
        storage.setArray(ar);
        System.out.println(new int[][]{{2,1,3},{2,1,3}}.length);
    }
}
