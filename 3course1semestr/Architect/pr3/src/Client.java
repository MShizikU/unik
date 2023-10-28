import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class Client {

    public static void main(String[] args) throws Exception {

        try (Socket socket = new Socket("localhost", 50001)) {
            Scanner scanner = new Scanner(System.in);

            Scanner in = new Scanner(socket.getInputStream());
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

            System.out.println("Enter your name");
            out.println(scanner.nextLine());
            System.out.println("Enter your message");

            Thread writer = new Thread(() -> {
                while (true) {
                    if (in.hasNextLine())
                        System.out.println(in.nextLine());
                }
            });

            writer.start();

            while (true) {
                if (scanner.hasNextLine()) {
                    out.println(scanner.nextLine());
                }
            }


        }
    }
}
