import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class PingPong {
    private static final int MAX_COUNT = 10;
    private static ReentrantLock lock = new ReentrantLock();
    private static Condition pingCondition = lock.newCondition();
    private static Condition pongCondition = lock.newCondition();
    private static volatile boolean pingTurn = true;

    public static void main(String[] args) {
        Thread pingThread = new Thread(() -> {
            try {
                lock.lock();
                for (int i = 0; i < MAX_COUNT; i++) {
                    while (!pingTurn) {
                        pingCondition.await();
                    }
                    System.out.println("Ping");
                    pingTurn = false;
                    pongCondition.signal();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        });

        Thread pongThread = new Thread(() -> {
            try {
                lock.lock();
                for (int i = 0; i < MAX_COUNT; i++) {
                    while (pingTurn) {
                        pongCondition.await();
                    }
                    System.out.println("Pong");
                    pingTurn = true;
                    pingCondition.signal();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        });

        pingThread.start();
        pongThread.start();
    }
}