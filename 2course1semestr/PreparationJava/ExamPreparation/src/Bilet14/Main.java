package Bilet14;

import java.util.Stack;

public class Main {
    public static void main(String[] args) {
        Stack<Integer> a = new Stack<>();
        Stack<Integer> b = new Stack<>();
        a.push(1);
        a.push(1);
        a.push(4);
        a.push(3);
        b.push(1);
        b.push(1);
        b.push(3);
        b.push(4);
        System.out.println(a);
        System.out.println(b);
        System.out.println(equals(a, b));
        System.out.println(a);
        System.out.println(b);
    }

    public static boolean equals(Stack<Integer> first, Stack<Integer> second){
        if (first.size() != second.size()) return false;
        Stack<Integer> tmp = new Stack<>();

        int basic_size = first.size();

        boolean checker = true;

        for(int i = 0; i < basic_size; i++){
            tmp.add(first.pop());
            if (tmp.peek().equals(second.peek())){
                checker = false;
            }
            tmp.add(second.pop());
        }

        int tmp_size = tmp.size();

        for(int i = 0; i < tmp_size; i+=2){
            second.add(tmp.pop());
            first.add(tmp.pop());
        }

        return checker;
    }
}
