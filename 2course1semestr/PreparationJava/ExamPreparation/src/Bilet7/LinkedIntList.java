package Bilet7;

public class LinkedIntList {
    private ListNode front;
    private ListNode last;

    LinkedIntList() {
        front = null;
        last = front;
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

    public void removeAll(ListNode second){
        if (second == null || front == null) return;
        ListNode firstIterator = front;
        ListNode secondIterator = second;
        ListNode previous = null;

        while(firstIterator != null && secondIterator != null){
            if(firstIterator.data == secondIterator.data){
                if (previous != null) {
                    previous.next = firstIterator.next;
                    firstIterator = firstIterator.next;
                }
                else {
                    front = front.next;
                    firstIterator = front;
                }
            }
            else if(firstIterator.data < secondIterator.data){
                previous = firstIterator;
                firstIterator = firstIterator.next;
            }
            else if (firstIterator.data > secondIterator.data){
                secondIterator = secondIterator.next;
            }
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

