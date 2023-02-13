package Bilet3;

import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        Map<String, String> basic1 = new HashMap<>();

        basic1.put("Marty", "Stepp");
        basic1.put("Stuart", "Reges");
        basic1.put("Jessica", "Miller");
        basic1.put("Amanda", "Camp");
        basic1.put("Hal", "Perkins");

        Map<String, String> basic2 = new HashMap<>();

        basic2.put("Kendrick", "Perkins");
        basic2.put("Stuart", "Reges");
        basic2.put("Jessica", "Miller");
        basic2.put("Bruce", "Reges");
        basic2.put("Hal", "Perkins");

        System.out.println(isUnique(basic1));
        System.out.println(isUnique(basic2));
        System.out.println(isUnique(new HashMap<String, String>()));
        System.out.println(isUnique(null));


    }

    public static boolean isUnique(Map<String, String> basic){
        if (basic == null || basic.isEmpty()) return true;
        String firstWord = "";

        for(String value : basic.values()){
            for(Map.Entry<String, String> entry : basic.entrySet()){
                if (firstWord.equals("")){
                    firstWord = entry.getValue();
                }
                else if (firstWord.equals(entry.getValue())){
                    return false;
                }
            }
            firstWord = "";
        }
        return true;
    }
}
