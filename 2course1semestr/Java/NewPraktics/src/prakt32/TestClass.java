package prakt32;


import java.io.*;
import java.util.Arrays;

public class TestClass {
    public static void main(String[] args) {

        String filename = "time.ser";
        TableOrdersManager tableOrdersManager = new TableOrdersManager(32);
        Order order = new TableOrder();
        order.add(new Dish("Lasagna", "Tasty Italian dish", 600));
        order.add(new Dish("Pasta", "Tasty Italian pasta", 1450));
        tableOrdersManager.add(order,1);
        try {
            ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(filename));
            out.writeObject(tableOrdersManager); //Write byte stream to file system.
            out.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch(IOException ex) {
            ex.printStackTrace();
        }

        tableOrdersManager = null;

        try {
            ObjectInputStream in = new ObjectInputStream(new FileInputStream(filename));
            tableOrdersManager = (TableOrdersManager)in.readObject();
            in.close();
        } catch(IOException ex){
            ex.printStackTrace();
        } catch(ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
        for(Order order1: tableOrdersManager.getOrders()){
            if (order1 != null){

                Arrays.stream(order1.getMenu()).toList().forEach((obj) -> System.out.println(obj));
            }
        }
        System.out.println("Manager: " + Arrays.toString(tableOrdersManager.getOrders()));
    }
}
