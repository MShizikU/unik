package task8.Obesrver;

import java.util.ArrayList;

public class Publisher implements InterfaceObesrver{

    private ArrayList<InterfSubscriber> subscribers = new ArrayList<>();

    @Override
    public void attach(InterfSubscriber subscriber) {
        subscribers.add(subscriber);
    }

    @Override
    public void detach(InterfSubscriber subscriber) {
        subscribers.remove(subscriber);
    }

    @Override
    public void notifySubscribers() {
        subscribers.forEach(InterfSubscriber::update);
    }
}
