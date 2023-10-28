import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.time.LocalDateTime;
import java.util.Queue;
import java.util.Scanner;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public class Server {
    // пул потоков
    private static final ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(20);
    //таски для отправки сообщений клиентам
    private static final Queue<Callable<Integer>> mailingTasks = new ConcurrentLinkedQueue<>();
    // нужно тк методы clear и size у буфера не синхронизированы
    private static final AtomicInteger numberOfMessagesInBuffer = new AtomicInteger(0);
    //буфер сообщений
    private static final StringBuffer globalMessageStringBuffer = new StringBuffer();

    public static void main(String[] args) throws IOException {
        try (ServerSocket serverSocket = new ServerSocket(50001)) {
            System.out.println("Server is running");
            while (true) {
                Socket clientSocket = serverSocket.accept();
                Callable<Integer> mailingTask = Server.registerClientMailingTask(clientSocket);
                scheduledExecutorService.execute(new ClientSession(clientSocket, mailingTask, new Scanner(clientSocket.getInputStream()).nextLine()));
            }
        }
    }

    public static Callable<Integer> registerClientMailingTask(Socket socket) {
        Callable<Integer> mailingTask = () -> {
            try {
                PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
                out.println(globalMessageStringBuffer);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return 0;
        };
        if (Server.mailingTasks.add(mailingTask)) {
            return mailingTask;
        } else {
            throw new RuntimeException("Failed to create mailing task for the client: " + socket);
        }
    }

    public static void makeMailing() {
        // синхронизации по буферу
        synchronized (globalMessageStringBuffer) {
            scheduledExecutorService.schedule(() -> {
                try {
                    //вызов тасок для отправки сообщений клиентам
                    scheduledExecutorService.invokeAll(mailingTasks);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    //очистка буфера не зависимо от успешности отправки сообщений
                    globalMessageStringBuffer.setLength(0);
                    Server.numberOfMessagesInBuffer.getAndSet(0);
                }
            }, 5, TimeUnit.SECONDS);
        }
    }

    private static class ClientSession implements Runnable {
        private final Socket socket;
        private final Callable<Integer> mailingTask;
        private final String nickname;

        public ClientSession(Socket clientSocket, Callable<Integer> clientMailingTask, String clientNickname) {
            this.socket = clientSocket;
            this.mailingTask = clientMailingTask;
            this.nickname = clientNickname;
        }

        @Override
        public void run() {
            try {
                Scanner in = new Scanner(socket.getInputStream());
                System.out.println("new user: " + nickname);
                while (true) {
                    if (in.hasNextLine()) {
                        globalMessageStringBuffer.append(LocalDateTime.now() + " " + nickname + ": " + in.nextLine() + "\n");
                        System.out.println("Buffer updated: \n" + globalMessageStringBuffer);
                        if (Server.numberOfMessagesInBuffer.incrementAndGet() == 1) {
                            Server.makeMailing();
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    socket.close();
                    mailingTasks.remove(mailingTask);
                    System.out.println(nickname + "leave");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
