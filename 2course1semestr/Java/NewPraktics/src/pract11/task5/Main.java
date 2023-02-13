package pract11.task5;

import java.util.ArrayList;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) {


        ArrayList<Integer> al = new ArrayList<>(100);
        LinkedList<Integer> ll = new LinkedList<>();
        for(int i = 0; i < 100000 ; i++){
            al.add(i);
            ll.add(i);
        }

        long startTime = System.currentTimeMillis();
            al.add(510500);
            al.add(50000,500106);
            al.remove(1000);
            al.indexOf(50000);
        long estimatedTime = System.currentTimeMillis() - startTime;
        System.out.println("Array list: " + estimatedTime);

        startTime = System.currentTimeMillis();
        ll.add(5105);
        ll.add(50000,5106);
        ll.remove(1000);
        ll.indexOf(50000);
        estimatedTime = System.currentTimeMillis() - startTime;
        System.out.println("Linked list: " + estimatedTime);

    }
}
