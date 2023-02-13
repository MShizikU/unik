package Bilet6;

import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;

public class Main {
    public static void main(String[] args) {
        System.out.println(Arrays.toString(guavaSort(new String[]{"Farm","Zoo","Car", "Apple", "Bee", "Golf", "Bee", "Dog", "Golf", "Zoo", "Zoo", "Bee", "Bee", "Apple" })));
    }

    public static String[] guavaSort(String[] array){
        Map<String, Integer> multiset = new TreeMap<>();

        String[] result = new String[array.length];

        for( var word : array){
            if (!multiset.containsKey(word)) multiset.put(word,1);
            else multiset.put(word, multiset.get(word)+1);
        }

        int i = 0, j = 0;

        System.out.println(multiset);

        for(var key : multiset.entrySet()){
            for(i = j; i < key.getValue() + j; i++) result[i] = key.getKey();
            j = i;
        }
        return result;
    }
}
