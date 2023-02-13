package pract11.task2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws ParseException {
        Scanner keyboard = new Scanner(System.in);
        String userDate = keyboard.nextLine();

        Date dateUser = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").parse(userDate);

        Date dateProgram = new Date();

        if (dateUser.compareTo(dateProgram) == 0){
            System.out.println("Пользовательское время равно системному");
        }
        else if(dateUser.compareTo(dateProgram) == 1){
            System.out.println("Пользовательское время больше системного");
        }
        else{
            System.out.println("Пользовательское время меньше системного");
        }
    }

}
