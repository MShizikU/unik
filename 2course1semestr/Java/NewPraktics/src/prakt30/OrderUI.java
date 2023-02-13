package prakt30;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class OrderUI extends JFrame {

    TableOrdersManager tableOrderManager = new TableOrdersManager(32);
    InternetOrdersManager internetTableManager = new InternetOrdersManager();

    Order currentInternetOrder = new InternetOrder();
    Order currentTableOrder = new TableOrder();

    int SelectedTable = -1;


    OrderUI(){
        super("orderUI");

        setSize(new Dimension(720,1080));

        setLayout(new GridLayout(3,3));

        JTextArea currentOrderText = new JTextArea("Order: ");
        currentOrderText.setEditable(false);

        JTextArea allOrdersText = new JTextArea("Orders: ");
        allOrdersText.setEditable(false);

        Map<String,Dish> dishesForOrder = new HashMap<>();
        dishesForOrder.put("Lazanya", new Dish("Lazanya", "Tasty lazanya", 500));
        dishesForOrder.put("Potato", new Dish("Potato", "Tasty potato", 400));
        dishesForOrder.put("Sausage", new Dish("Sausage", "Tasty sausage", 300));

        Map<String, Drink> drinksForOrder = new HashMap<>();
        drinksForOrder.put("Vodka", new Drink("Vodka", "Alcohol drink", 500, DrinkTypeEnum.VODKA,40));
        drinksForOrder.put("Water", new Drink("Water", "Not alcohol drink", 400, DrinkTypeEnum.WATER, 0));
        drinksForOrder.put("Tea", new Drink("Tea", "Tasty tea", 300, DrinkTypeEnum.TEA, 0));

        JComboBox dishesOrderComboBox = new JComboBox(dishesForOrder.keySet().toArray());
        dishesOrderComboBox.setMaximumSize(new Dimension(200,200));
        dishesOrderComboBox.setBackground(Color.white);

        JComboBox drinksOrderComboBox = new JComboBox(drinksForOrder.keySet().toArray());
        drinksOrderComboBox.setMaximumSize(new Dimension(200,200));
        drinksOrderComboBox.setBackground(Color.white);

        JButton btnCreateOrder = new JButton("Add order");

        JRadioButton btnInternetOrder = new JRadioButton("Internet order");
        btnInternetOrder.setSelected(true);
        JRadioButton btnTableOrder = new JRadioButton("Table order");
        btnTableOrder.setSelected(false);
        ButtonGroup chooseType = new ButtonGroup();
        chooseType.add(btnTableOrder);
        chooseType.add(btnInternetOrder);

        JComboBox tables = new JComboBox(Arrays.toString(tableOrderManager.freeTableNumbers()).split("[\\[\\]]")[1].split(", "));
        tables.setVisible(false);
        tables.setBackground(Color.white);

        add(btnInternetOrder);
        add(tables);
        add(btnTableOrder);
        add(currentOrderText);
        add(btnCreateOrder);
        add(allOrdersText);
        add(dishesOrderComboBox);
        add(new JTextField());
        add(drinksOrderComboBox);





        tables.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String option = (String) ((JComboBox) e.getSource()).getSelectedItem();
                SelectedTable = Integer.parseInt(option );
            }
        });
        btnTableOrder.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tables.setVisible(true);
                currentInternetOrder = new InternetOrder();
                currentOrderText.setText("Order: ");
            }
        });

        btnInternetOrder.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tables.setVisible(false);
                currentTableOrder = new TableOrder();
                currentOrderText.setText("Order: ");
            }
        });

        dishesOrderComboBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String option = ((JComboBox)e.getSource()).getSelectedItem().toString();
                if (btnTableOrder.isSelected())
                    currentTableOrder.add(dishesForOrder.get(option));
                else
                    currentInternetOrder.add(dishesForOrder.get(option));

                currentOrderText.append("\n" + dishesForOrder.get(option) + "\n");
            }
        });

        drinksOrderComboBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String option = ((JComboBox)e.getSource()).getSelectedItem().toString();
                if (btnTableOrder.isSelected())
                    currentTableOrder.add(drinksForOrder.get(option));
                else
                    currentInternetOrder.add(drinksForOrder.get(option));

                currentOrderText.append("\n" + drinksForOrder.get(option) + "\n");
            }
        });



        btnCreateOrder.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                currentOrderText.setText("Order: ");
                if(currentTableOrder.getItems().size() == 0 && currentInternetOrder.getItems().size() == 0) return;
                if (btnTableOrder.isSelected()){
                    if(SelectedTable == -1) return;
                    tableOrderManager.add(currentTableOrder, SelectedTable);

                    String currentOrder = "\nOrder: ";
                    for(MenuItem item : currentTableOrder.getItems()){
                        currentOrder += item  + "\n";
                    }
                    currentOrder += "( " + SelectedTable + " )" +  "\n";
                    allOrdersText.append(currentOrder);
                    currentTableOrder = new TableOrder();
                    SelectedTable = -1;
                }
                else{
                    internetTableManager.add(currentInternetOrder, new Customer("Stas", "Sidorov", 22, new Address("Moscow", 600009, "Mira", 24, 36)));
                    String currentOrder = "\nOrder: \n";
                    for(MenuItem item : currentInternetOrder.getItems()){
                        currentOrder += item  + "\n";
                    }
                    currentOrder += "\n";
                    allOrdersText.append(currentOrder);
                    currentInternetOrder = new InternetOrder();
                }

            }
        });


    }

    public static void main(String[] args) {
        new OrderUI().setVisible(true);
    }


}
