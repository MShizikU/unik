package pract24.task2;

import java.util.Scanner;

public class User {

    public void sit(){
        int userInput;
        Scanner keyboard = new Scanner(System.in);

        while (true){
            System.out.println("\n1. Victorian chair \n2. MultiFunc Chair \n3. Magic chair \n4. Exit\n");
            userInput = keyboard.nextInt();
            switch (userInput){
                case 1 : new VictorianChairFactory().createChair().use(); break;
                case 2 : new MultiFuncChairFactory().createChair().use(); break;
                case 3 : new MagicChairFactory().createChair().use(); break;
                case 4 : return;
            }
        }
    }

}
