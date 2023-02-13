package Bilet21;

public class Main {
    public static void main(String[] args) {
        String[] a = {"123", "32", "asdad"};
        Finder<String> b = new Finder<>();
        System.out.println(b.find(a, "32"));
    }
}
