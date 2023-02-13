package prakt29;

import java.util.Arrays;

public class Test {

    public static void main(String[] args) {
        Order restaurantOrder = new RestaurantOrder();
        restaurantOrder.add(new Dish(600, "Tasty Italian dish", "Lasagna"));
        restaurantOrder.add(new Drink(190, "Orange", "Juice"));

        System.out.println(Arrays.toString(restaurantOrder.getMenu()));
        System.out.println("\n" + "Restaurant orders: ");
        OrderManager orderManager = new OrderManager();
        try{
            orderManager.add(restaurantOrder, 1);
        } catch (OrderAlreadyException e) {
            System.out.println(e.getMessage());
        }





        OrderManager orderManager1 = new OrderManager();
        Order internetOrder = new InternetOrder();
        internetOrder.add(new Dish(600, "Tasty Italian dish", "Lasagna"));
        internetOrder.add(new Drink(190, "Orange", "Juice"));
        String address = "Moscow ul.Mira 41, 60";

        try {
            orderManager1.add(internetOrder, address);
        } catch (OrderAlreadyException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(Arrays.toString(internetOrder.getMenu()));
    }
}
