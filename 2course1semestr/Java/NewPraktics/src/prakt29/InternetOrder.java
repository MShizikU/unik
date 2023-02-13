package prakt29;

import java.awt.*;
import java.util.ArrayList;
import java.util.Comparator;

public class InternetOrder implements Order{
    MyDoubleList internetOrders;


    InternetOrder(){
        internetOrders = new MyDoubleList();
    }

    public void getOrder(ArrayList<Item> order){
        for(Item item : order) internetOrders.add(item);
    }

    @Override
    public String[] getMenu(){
        String[] str = new String[internetOrders.size()];
        for (int i = 0; i < internetOrders.size(); i++){
            str[i] = internetOrders.get(i).getName() + " " + internetOrders.get(i).getDiscription() + " " + internetOrders.get(i).getCost();
        }
        return str;
    }

    @Override
    public boolean add(Item item) {
        return internetOrders.add(item);
    }

    @Override
    public boolean remove(String name) {
        return internetOrders.remove(name);
    }

    @Override
    public int removeAll(String name) {
        int count = internetOrders.contains(name);
        while(internetOrders.contains(name) != 0) remove(name);
        return count;
    }

    @Override
    public int getCount() {
        return internetOrders.size();
    }

    @Override
    public ArrayList getArray() {
        return internetOrders.convertToAL();
    }

    @Override
    public int getCost() {
        ArrayList<Item> al = internetOrders.convertToAL();
        int total = 0;
        for(Item item : al) total += item.getCost();
        return total;
    }

    @Override
    public int getAmount(String name) {
        return internetOrders.contains(name);
    }

    @Override
    public ArrayList getSortedArray() {
        ArrayList<Item> al = internetOrders.convertToAL();
        al.sort(Comparator.comparing(Item::getCost));
        return al;
    }


}
