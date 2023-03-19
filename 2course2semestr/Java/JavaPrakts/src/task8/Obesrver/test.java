package task8.Obesrver;

public class test {
    public static void main(String[] args) {
        InterfSubscriber sub1 = new Subscriber();
        InterfSubscriber sub2 = new Subscriber();
        InterfSubscriber sub3 = new Subscriber();

        InterfaceObesrver obs = new Publisher();
        obs.attach(sub1);
        obs.attach(sub2);
        obs.attach(sub3);
        obs.detach(sub1);
        obs.notifySubscribers();
    }
}
