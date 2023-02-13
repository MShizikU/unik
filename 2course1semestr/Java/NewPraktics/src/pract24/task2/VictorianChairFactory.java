package pract24.task2;

public class VictorianChairFactory implements AbstractChairFactory{


    public Chair createChair() {
        return new VictorianChair();
    }

}
