package task8.Obesrver;

public interface InterfaceObesrver {
    public void attach(InterfSubscriber subscriber);
    public void detach(InterfSubscriber subscriber);

    public void notifySubscribers();

}
