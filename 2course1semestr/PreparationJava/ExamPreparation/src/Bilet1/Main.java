package Bilet1;

import java.lang.reflect.Type;
import java.util.LinkedList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        LinkedList<Integer> first = new LinkedList<>();
        LinkedList<Integer> second = new LinkedList<>();

        first.add(1);
        first.add(2);
        first.add(3);
        first.add(4);
        first.add(5);
        first.add(11);
        first.add(12);

        System.out.println(alternate(first,second));
    }

    public static LinkedList<Integer> alternate(LinkedList<Integer> first, LinkedList<Integer> second){
        LinkedList<Integer> result = new LinkedList<>();
        int last_symb;
        for(last_symb = 0; last_symb < first.size() && last_symb < second.size(); last_symb++){
            result.add(first.get(last_symb));
            result.add(second.get(last_symb));
        }

        if (last_symb == first.size())
            for(int i = last_symb; i < second.size(); i++) result.add(second.get(i));
        else
            for(int i = last_symb; i < first.size(); i++)
                result.add(first.get(i));

        return result;

    }
}
