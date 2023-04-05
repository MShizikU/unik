package task8.State;

public class SecondState implements StateAction{
    @Override
    public void run() {
        System.out.println("Second run");
    }

    @Override
    public void stop() {
        System.out.println("Second stop");
    }
}
