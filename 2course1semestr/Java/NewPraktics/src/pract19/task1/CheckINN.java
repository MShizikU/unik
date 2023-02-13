package pract19.task1;

import java.math.BigInteger;
import java.util.Scanner;

public class CheckINN {

    public static void main(String[] args) {

        Scanner keyboard = new Scanner(System.in);

        while(true){
            System.out.println("Введите Ваш ИНН:");
            try{
                BigInteger inn =  new BigInteger(keyboard.nextLine());
                checkINN(inn);
                break;
            }catch (INNException e){
                System.out.println(e);
            }
        }
        System.out.println("ИНН действителен!");
    }

    public static void checkINN(BigInteger INN) throws INNException {
        int counter = 0;
        while (INN.compareTo(new BigInteger("0")) > 0){
            INN = INN.divide(new BigInteger("10"));
            counter++;
        }
        if(counter != 12 && counter != 10) throw new INNException();
    }
}
