package Bilet2;

import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        Map<Integer, String> basic = new HashMap<>();
        basic.put(1, "Один");
        basic.put(2, "Два");
        basic.put(3, "Три");
        basic.put(4, "Четыре");
        basic.put(5, "Пять");
        basic.put(6, "Шесть");
        basic.put(7, "Семь");
        basic.put(8, "Три");
        System.out.println(basic);
        System.out.println(reverse(basic));
    }

    public static Map<String, Integer> reverse(Map<Integer, String> basic){
        Map<String, Integer> result = new HashMap<>();
        for( Map.Entry<Integer, String> entry : basic.entrySet()){
            result.put(entry.getValue(), entry.getKey());
        }
        return result;
    }

}
