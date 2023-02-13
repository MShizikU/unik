package Bilet11;


public class Main {
    public static void main(String[] args) {
        LinkedIntList list = new LinkedIntList();

        list.add(14);
        list.add(8);
        list.add(14);
        list.add(12);
        list.add(1);


        System.out.println(list);
        list.firstLast();
        System.out.println(list);
    }
}
