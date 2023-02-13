package Bilet9;


public class Main {
    public static void main(String[] args) {
        LinkedIntList list = new LinkedIntList();

        list.add(14);
        list.add(8);
        list.add(14);
        list.add(12);
        list.add(1);
        list.add(14);
        list.add(11);
        list.add(8);
        list.add(8);
        list.add(10);
        list.add(4);
        list.add(9);
        list.add(1);
        list.add(2);
        list.add(5);
        list.add(2);
        list.add(4);
        list.add(12);
        list.add(12);

        System.out.println(list);
        list.removeDuplicates();
        System.out.println(list);
    }
}
