package pract16.task3;

import javax.swing.*;
import java.awt.*;

public class CheckingPassword extends JFrame {

    public CheckingPassword(){
        super("CheckingPassword");
        Container contentPane = getContentPane();
        SpringLayout layout = new SpringLayout();
        contentPane.setLayout(layout);
        setSize(1080,720);
        setBackground(Color.gray);

        JPanel service_label_panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel service_label = new JLabel("Service: ");
        service_label_panel.add(service_label);
        add(service_label_panel);

        JPanel service_field_panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JTextField service_field = new JTextField();
        service_field.setPreferredSize(new Dimension(100, 20));;
        service_field.setBorder(BorderFactory.createLineBorder(Color.black));
        service_field_panel.add(service_field);
        add(service_field_panel);



        JPanel name_label_panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel name_label = new JLabel("User name: ");
        name_label_panel.add(name_label);
        add(name_label_panel);

        JPanel name_field_panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JTextField name_field = new JTextField();
        name_field.setPreferredSize(new Dimension(100, 20));;
        name_field.setBorder(BorderFactory.createLineBorder(Color.black));
        name_field_panel.add(name_field);
        add(name_field_panel);

        JPanel password_label_panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel password_label = new JLabel("Password: ");
        password_label_panel.add(password_label);
        add(password_label_panel);

        JPanel password_field_panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JTextField password_field = new JTextField();
        password_field.setPreferredSize(new Dimension(100, 20));;
        password_field.setBorder(BorderFactory.createLineBorder(Color.black));
        password_field_panel.add(password_field);
        add(password_field_panel);


        layout.putConstraint(SpringLayout.WEST, service_label_panel, 5, SpringLayout.WEST, contentPane);
        layout.putConstraint(SpringLayout.WEST, service_field_panel, 100, SpringLayout.WEST, service_label_panel);
        layout.putConstraint(SpringLayout.NORTH, name_label_panel, 15, SpringLayout.SOUTH,service_label_panel );
        layout.putConstraint(SpringLayout.WEST, name_label_panel, 5, SpringLayout.WEST, contentPane);
        layout.putConstraint(SpringLayout.NORTH, name_field_panel, 10, SpringLayout.SOUTH,service_field_panel );
        layout.putConstraint(SpringLayout.WEST, name_field_panel, 100, SpringLayout.WEST, name_label_panel);
        layout.putConstraint(SpringLayout.NORTH, password_label_panel, 15, SpringLayout.SOUTH,name_label_panel );
        layout.putConstraint(SpringLayout.WEST, password_label_panel, 5, SpringLayout.WEST, contentPane);
        layout.putConstraint(SpringLayout.NORTH, password_field_panel, 15, SpringLayout.SOUTH,name_field_panel );
        layout.putConstraint(SpringLayout.WEST, password_field_panel, 100, SpringLayout.WEST, password_label_panel);


    }


    public static void main(String[] args) {
        new CheckingPassword().setVisible(true);
    }
}
