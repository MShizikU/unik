package Bilet11;

public class LinkedIntList {
    private ListNode front;

    LinkedIntList() {
        front = null;
    }

    public ListNode getFront(){
        return front;
    }

    public void add(int data){
        ListNode last = front;
        if (front == null){
            front = new ListNode(data, null);
        }
        else {
            while(last.next!= null) last = last.next;
            last = new ListNode(data,last);
        }
    }

    public void firstLast(){
        ListNode first = front;
        front = front.next;
        ListNode last = front;
        while(last.next != null) last = last.next;

        last.next = first;
        first.next = null;
    }


    @Override
    public  String toString(){
        String result = "";
        ListNode current = front;

        while(current != null){
            result += current.data + " ";
            current = current.next;
        }
        return result;
    }
}

