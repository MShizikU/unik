package pract3.task3.Convertor;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Shop {

    Map<String, Integer> mapShopList = new HashMap<>();
    String[] Goods = {"Shoes", "Dress", "Hat", "Roap"};

    Shop(){
        mapShopList.put("Shoes", 42);
        mapShopList.put("Dress", 32);
        mapShopList.put("Hat", 50);
        mapShopList.put("Roap",5);
    }

    public void execute(){
        do {
            System.out.println(mapShopList);
            System.out.println("\nChoose a good and write the code(exit-5): \n");
            Scanner keyboard = new Scanner(System.in);
            Integer iChosenGood = 0;
            iChosenGood = keyboard.nextInt();
            while ((iChosenGood < 1 || iChosenGood > 4) && iChosenGood != 5) {
                System.out.println("\nWrong choice, try again: \n");
                iChosenGood = keyboard.nextInt();
            }

            if(iChosenGood == 5) break;

            Convertor convertor = new Convertor();
            convertor.convertCurrency(0, mapShopList.get(Goods[iChosenGood]));


        } while(true);

    }

    public static void main(String[] args) {
        new Shop().execute();
    }

}
