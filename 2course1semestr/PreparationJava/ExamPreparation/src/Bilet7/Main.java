package Bilet7;

public class Main {
    public static void main(String[] args) {
        LinkedIntList list1 = new LinkedIntList();
        list1.add(1);
        list1.add(3);
        list1.add(5);
        list1.add(7);
        LinkedIntList list2 = new LinkedIntList();
        list2.add(1);
        list2.add(2);
        list2.add(3);
        list2.add(4);
        list2.add(5);

        System.out.println(list1);
        list2.removeAll(list1.getFront());
        System.out.println(list2);
    }


}
