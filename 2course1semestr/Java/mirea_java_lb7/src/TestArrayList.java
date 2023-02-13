import java.util.Comparator;

public class TestArrayList {
    public static void main(String[] args) {
        CustomArrayList<String> al = new CustomArrayList<>();
        al.add("one");
        al.add("two");
        al.add("three");
        al.add("five");
        System.out.println(al);
        al.add(3,"four");
        System.out.println(al.get(2));
        System.out.println(al.indexOf("four"));
        al.add(4,"four");
        System.out.println(al.lastIndexOf("four"));
        al.remove(4);
        al.set(4,"last");
        CustomArrayList<String> newAl = al.sublist(1,3);
        System.out.println(newAl);
        System.out.println(al);
        CustomArrayList<Integer> ints = new CustomArrayList<>();
        ints.add(1);
        ints.add(5);
        ints.add(42);
        ints.add(2);
        ints.add(0);
        ints.sort(Integer::compareTo);
        System.out.println(ints);
    }
}
