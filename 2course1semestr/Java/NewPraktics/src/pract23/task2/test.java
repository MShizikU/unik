package pract23.task2;

public class test {

    public static void main(String[] args) {
        AbstractQueue queue = new LinkedQueue();
        fill(10,queue);
        System.out.println(queue.show());
        System.out.println(queue.element());
        System.out.println(queue.dequeue());
        System.out.println(queue.size());
        System.out.println(queue.isEmpty());
        queue.clear();
        System.out.println(queue.show());
    }

    public static void fill(int size, AbstractQueue queue){
        for (int i = 0; i  < size; i++) queue.enqueue(i);
    }

}
