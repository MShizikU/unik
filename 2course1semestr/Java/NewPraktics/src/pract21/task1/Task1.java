package pract21.task1;

import java.util.ArrayList;

public class Task1 {

    public static <E> void ArrayToArrayList(E[] a, ArrayList<E> lst) {
        for (E e : a) lst.add(e);
    }

    public static void main(String[] args) {
        ArrayList<String> al = new ArrayList<>();
        String[] ar = new String[5];
        ar[0] = "a";
        ar[1] = "b";
        ar[2] = "c";
        ar[3] = "d";
        ar[4] = "e";
        ArrayToArrayList(ar,al);
        System.out.println(al);
    }


}
