package pract6.task13;

public class Main {
    public static void main(String[] args) {
        MyStringBuilder stringBuilder = new MyStringBuilder();
        stringBuilder.setOnChangeListener(new MyListener());
        stringBuilder.append("str");
        stringBuilder.reverse();
        stringBuilder.delete(1,2);
    }
}
