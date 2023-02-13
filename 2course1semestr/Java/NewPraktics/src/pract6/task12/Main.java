package pract6.task12;

public class Main {
    public static void main(String[] args) {
        String tmp = "str";
        MyStringBuilder stringBuilder = new MyStringBuilder();
        stringBuilder.append(tmp);
        stringBuilder.reverse();
        System.out.println(stringBuilder);
        stringBuilder.undo();
        System.out.println(stringBuilder);
    }
}
