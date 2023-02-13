package Bilet25;

import java.util.LinkedList;

public class MyStack {
    LinkedList<Integer> list;

    MyStack(){
        list = new LinkedList<>();
    }

    public int size(){
        return list.size();
    }

    public boolean isEmpty(){
        return list.isEmpty();
    }

    public Integer pop(){
        return list.removeLast();
    }

    public Integer top(){
        return list.peekLast();
    }

    public void push(int element){
        list.add(element);
    }
}
