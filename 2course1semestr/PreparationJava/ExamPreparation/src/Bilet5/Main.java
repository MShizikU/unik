package Bilet5;

import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        Map<String, Integer> map = new HashMap<>();
        map.put("Alyssa", 22);
        map.put("Char", 25);
        map.put("Dan", 25);
        map.put("Jeff", 20);
        map.put("Kasey", 20);
        map.put("Kim", 20);
        map.put("Mogran", 25);
        map.put("Ryan", 25);
        map.put("Stef", 22);
        rarest(map);
    }

    public static Integer rarest(Map<String, Integer> basic){
        Map<Integer,Integer> temp = new HashMap<>();

        for(Integer value : basic.values()){
            if (temp.containsKey(value)) temp.put(value, temp.get(value) + 1);
            else temp.put(value,1);
        }

        int rarestYear = -1;
        int minCount = -1;

        for(Map.Entry<Integer, Integer> entry : temp.entrySet()){
            if (entry.getValue() < minCount || minCount == -1){
                minCount = entry.getValue();
                rarestYear = entry.getKey();
            }else if (entry.getValue() == minCount){
                if (rarestYear > entry.getKey()){
                    minCount = entry.getValue();
                    rarestYear = entry.getKey();
                }
            }
        }
        System.out.println("Редчайший год: " + rarestYear);
        return rarestYear;
    }
}
