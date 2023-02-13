package prakt29;

import java.awt.*;
import java.util.ArrayList;

public class MyDoubleList {
    ListElement head = null;

    public int size(){
        if(head == null) return 0;

        int count = 0;
        ListElement tmp = head;
        while(tmp != null){
            tmp = tmp.nextItem;
            count++;
        }
        return count;

    }

    public boolean add(Item item){
        if(head == null) {
            head = new ListElement(item, null);
            return true;
        }else{
            ListElement tmp = head;
            while(tmp.nextItem != null) tmp = tmp.nextItem;
            tmp.nextItem = new ListElement(item, tmp);
            return true;
        }
    }

    public boolean remove(String name){
        ListElement tmp = head;
        if(head != null && head.item.getName() == name){
            head = head.nextItem;
        }
        while(tmp.nextItem != null && tmp.item.getName() != name) tmp = tmp.nextItem;

        if(tmp == null) return false;

        if(tmp.nextItem != null && tmp.prevItem != null) {
            ListElement prev = tmp.prevItem;
            ListElement next = tmp.nextItem;
            prev.nextItem = tmp.nextItem;
            next.prevItem = tmp.prevItem;
        } else if(tmp.prevItem != null){
            tmp.prevItem.nextItem = null;
        }

        return true;
    }

    public int contains(Item item){
        ListElement tmp = head;
        int count = 0;

        while(tmp != null)
            if (item.getCost() == tmp.item.getCost() && item.getName() == tmp.item.getName() && item.getDiscription() == tmp.item.getDiscription()) {
                count++;
                tmp = tmp.nextItem;
            }
            else
                tmp = tmp.nextItem;
        return count;
    }

    public int contains(String name){
        ListElement tmp = head;
        int count = 0;

        while(tmp != null)
            if (name == tmp.item.getName()) {
                count++;
                tmp = tmp.nextItem;
            }
            else
                tmp = tmp.nextItem;
        return count;
    }

    public ArrayList<Item> convertToAL(){
        ArrayList<Item> result = new ArrayList<>();
        ListElement tmp = head;

        while (tmp != null){
            result.add(tmp.item);
            tmp = tmp.nextItem;
        }
        return result;
    }

    public Item get(int i){
        if (i > size()) return null;

        int count = 0;

        ListElement tmp = head;

        while(tmp != null && count++ != i) tmp = tmp.nextItem;

        return (tmp!= null) ?  tmp.item : null;
    }



}
