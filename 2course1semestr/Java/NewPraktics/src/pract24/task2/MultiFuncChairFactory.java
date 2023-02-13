package pract24.task2;

public class MultiFuncChairFactory implements AbstractChairFactory{

    public Chair createChair() {
        return new MultiFuncChair();
    }
}
