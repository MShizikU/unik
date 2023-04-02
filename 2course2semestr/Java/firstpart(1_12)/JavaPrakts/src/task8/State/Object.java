package task8.State;

public class Object {
    private StateAction current = new FirstState();
    public void run(){
        current.run();
    }
    public void stop(){
        current.stop();
    }
    public void change(){
        current = new SecondState();
    }
}
