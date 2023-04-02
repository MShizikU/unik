package task8.Obesrver;

public class Subscriber implements InterfSubscriber{
    @Override
    public void update() {
        System.out.println("Wow i was updated");
    }
}
