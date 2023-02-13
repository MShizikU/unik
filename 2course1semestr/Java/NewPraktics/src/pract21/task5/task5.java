package pract21.task5;

import java.util.*;

public class task5 {

    public static void main(String[] args) {
        System.out.println(newArrayList(10,20,30,40,50));
        System.out.println(newHashSet(10,45,22,22,31));
        LinkedList<Integer> keys = new LinkedList<>();
        keys.add(1);
        keys.add(2);
        keys.add(3);
        LinkedList<Integer> values = new LinkedList<>();
        values.add(4);
        values.add(5);
        values.add(6);
        System.out.println(newHashMap(keys, values));
    }

    public static <T> ArrayList<T> newArrayList(T... elements){
        ArrayList<T> alResult = new ArrayList<>();

        for( T element : elements) alResult.add(element);

        return alResult;
    }

    public static <T> HashSet<T> newHashSet(T... elements){
        HashSet<T> hsResult = new HashSet<>();

        for( T element : elements) hsResult.add(element);

        return hsResult;
    }

    public static <K, V> HashMap<K, V> newHashMap(List<? extends K> keys, List<? extends V> values){
        HashMap<K, V> hmResult = new HashMap<>();

        if (keys.size() != values.size()) return hmResult;

        for (int i = 0; i < keys.size(); i++) hmResult.put(keys.get(i), values.get(i));
        return hmResult;
    }

}
