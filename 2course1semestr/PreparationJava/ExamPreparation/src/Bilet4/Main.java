package Bilet4;

import java.util.HashSet;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        Set<Integer> basic = new HashSet<>();
        basic.add(2);
        basic.add(4);
        basic.add(26);
        basic.add(48);
        basic.add(22);
        basic.add(41);
        basic.add(20);
        basic.add(40);
        System.out.println(hasOdd(basic));
    }

    public static boolean hasOdd(Set<Integer> basic){
        for(Integer entry : basic)
            if (entry % 2 != 0 ) return false;
        return true;
    }
}
