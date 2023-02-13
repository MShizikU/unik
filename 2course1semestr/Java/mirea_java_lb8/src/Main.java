import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner textScanner = new Scanner(System.in);
        System.out.println("If you want to close the program -> write exit");
        try (FileWriter writer = new FileWriter("C:/Users/sidor/Desktop/mirea_java_lb8.txt")){
            String currentText = "";
            do{
                currentText = textScanner.nextLine();
                if(!currentText.toLowerCase().equals("exit")){
                    writer.write(currentText);
                    writer.write('\n');
                    writer.flush();
                }
                else{
                    break;
                }
            } while(!currentText.equals("exit"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
