package Bilet26;

import java.util.LinkedList;

public class MyArrayList {

    LinkedList<Integer> list = new LinkedList<>();


    public void add(Integer element){ list.add(element); }
    public void remove(Integer index){ list.remove(index); }
    public Integer get(Integer index){ return list.get(index); }
    public Integer size() { return list.size(); }
    public boolean isEmpty() { return list.isEmpty(); }
}
