package Bilet27;

public class Main {
    public static void main(String[] args) {
        MyArrayList al = new MyArrayList();
        al.add(1);
        al.add(3);
        al.add(4);
        al.add(5);
        al.add(4);
        al.add(3);
        al.add(2);
        al.add(1);
        System.out.println(al);
        System.out.println(al.size());
        System.out.println(al.get(0));
        System.out.println(al.get(5));
        al.remove(3);
        System.out.println(al);
    }
}
