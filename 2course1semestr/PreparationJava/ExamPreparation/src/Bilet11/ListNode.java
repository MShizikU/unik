package Bilet11;

public class ListNode {
    public int data;
    public ListNode next;

    ListNode(int data, ListNode prev){
        if(prev != null)
            prev.next = this;
        this.data = data;
    }
}
