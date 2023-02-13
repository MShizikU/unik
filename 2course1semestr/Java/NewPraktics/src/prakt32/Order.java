package prakt32;

import java.io.Serializable;
import java.util.ArrayList;

public interface Order extends Serializable {

    boolean add(MenuItem item);
    String[] itemsNames();
    int itemsQuantity(String itemName);
    int itemsQuantity(MenuItem item);
    int itemsQuantity();

    String[] getMenu();

    ArrayList<MenuItem> getItems();
    boolean remove(String itemName);
    boolean remove(MenuItem item);
    int removeAll(String itemName);
    int removeAll(MenuItem item);
    ArrayList<MenuItem> sortedItemsByCostDesc();
    double costTotal();
    Customer getCustomer();
    void setCustomer(Customer newCustomer);
}