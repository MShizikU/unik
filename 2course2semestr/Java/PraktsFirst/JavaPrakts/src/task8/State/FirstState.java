package task8.State;

public class FirstState implements StateAction{
    @Override
    public void run() {
        System.out.println("First run");
    }

    @Override
    public void stop() {
        System.out.println("First stop");
    }
}
