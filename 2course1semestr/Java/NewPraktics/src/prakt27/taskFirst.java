package prakt27;

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class taskFirst {

    public static void main(String[] args)
    {
        Set<String> hashSet = new HashSet<>();

        hashSet.add("1");
        hashSet.add("2");
        hashSet.add("3");


        Set<String> treeSet = new TreeSet<>(hashSet);
        System.out.println(treeSet);
    }

}
