package Bilet9;

public class LinkedIntList {
    private ListNode front;
    private ListNode last;

    LinkedIntList() {
        front = null;
        last = null;
    }

    public ListNode getFront(){
        return front;
    }

    public void add(int data){
        if (front == null){
            front = new ListNode(data, null);
            last = front;
        }
        else last = new ListNode(data, last);
    }

    public void removeDuplicates(){
        if (front == null) return;
        ListNode firstIterator = front;
        ListNode previous = null;

        while(firstIterator != null){
            ListNode secondIterator = firstIterator.next;
            previous = firstIterator;
            while (secondIterator != null) {
                if (firstIterator.data == secondIterator.data) {
                    if (previous != null) {
                        previous.next = secondIterator.next;
                        secondIterator = secondIterator.next;
                    }
                } else {
                    previous = secondIterator;
                    secondIterator = secondIterator.next;
                }
            }
            firstIterator = firstIterator.next;

        }
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

