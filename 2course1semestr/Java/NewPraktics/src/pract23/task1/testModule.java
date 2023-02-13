package pract23.task1;

public class testModule {
    public static void main(String[] args) {
        new ArrayQueueModule();
        fill(10);
        System.out.println(ArrayQueueModule.show());
        System.out.println(ArrayQueueModule.element());
        System.out.println(ArrayQueueModule.dequeue());
        System.out.println(ArrayQueueModule.size());
        System.out.println(ArrayQueueModule.isEmpty());
        ArrayQueueModule.clear();
        System.out.println(ArrayQueueModule.show());
    }

    public static void fill(int size){
        for(int i =0 ;i < size; i++){
            ArrayQueueModule.enqueue(i);
        }
    }
}
