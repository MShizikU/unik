package Bilet29;

public class Main {
    public static void main(String[] args) {
        MyStackArray<Integer> stack = new MyStackArray<>();
        stack.push(10);
        stack.push(12);
        stack.push(13);
        stack.push(14);
        stack.push(15);
        stack.push(16);
        System.out.println(stack);
        System.out.println(stack.pop());
        System.out.println(stack);
        System.out.println(stack.top());
        System.out.println(stack.size());
        System.out.println(stack.isEmpty());
        MyStackArray<Integer> stack2 = new MyStackArray<>();
        System.out.println(stack2.isEmpty());
    }
}
