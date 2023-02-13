package pract15;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class SimpleCalculator extends JFrame{




    public SimpleCalculator(){
        super("Simple Calculator");
        setSize(800,800);
        setLayout(new GridLayout(4,2));

        JPanel[] panel = new JPanel[8];

        JLabel labelFirstNumber = new JLabel();
        JLabel labelSecondNumber = new JLabel();
        Font fontSmall = new Font("Times new roman",Font.BOLD,16);



        JTextField textFirstNumber = new JTextField(4);
        JTextField textSecondNumber = new JTextField(4);
        Font fontLarge = new Font("Times new roman",Font.BOLD,32);

        Font fontMedium = new Font ("Times new roman", Font.BOLD, 24);

        JButton btnPlus = new JButton("+");
        btnPlus.setFocusPainted(false);
        btnPlus.setBackground(Color.WHITE);
        btnPlus.setFont(fontMedium);

        JButton btnMinus = new JButton("-");
        btnMinus.setFont(fontMedium);
        btnMinus.setFocusPainted(false);
        btnMinus.setBackground(Color.WHITE);

        JButton btnDivision = new JButton("/");
        btnDivision.setFocusPainted(false);
        btnDivision.setBackground(Color.WHITE);
        btnDivision.setFont(fontMedium);

        JButton btnMultiplication = new JButton("*");
        btnMultiplication.setFocusPainted(false);
        btnMultiplication.setBackground(Color.WHITE);
        btnMultiplication.setFont(fontMedium);



        for (int i = 0; i < 8; i++){
            panel[i] = new JPanel();
            panel[i].setBackground(Color.WHITE);
            add(panel[i]);
        }

        panel[0].add(textFirstNumber);
        textFirstNumber.setForeground(Color.black);
        textFirstNumber.setBorder(BorderFactory.createLineBorder(Color.black));
        textFirstNumber.setFont(fontLarge);

        panel[1].add(textSecondNumber);
        textSecondNumber.setForeground(Color.black);
        textFirstNumber.setBorder(BorderFactory.createLineBorder(Color.black));
        textSecondNumber.setFont(fontLarge);

        panel[2].add(labelFirstNumber);
        labelFirstNumber.setFont(fontSmall);
        labelFirstNumber.setText("1st Number");

        panel[3].add(labelSecondNumber);
        labelSecondNumber.setFont(fontSmall);
        labelSecondNumber.setText("2nd Number");


        panel[4].add(btnPlus);
        textFirstNumber.setBorder(BorderFactory.createLineBorder(Color.black));
        panel[5].add(btnDivision);
        textFirstNumber.setBorder(BorderFactory.createLineBorder(Color.black));
        panel[6].add(btnMinus);
        textFirstNumber.setBorder(BorderFactory.createLineBorder(Color.black));
        panel[7].add(btnMultiplication);
        textFirstNumber.setBorder(BorderFactory.createLineBorder(Color.black));


        btnPlus.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    double firstNum = Double.parseDouble(textFirstNumber.getText().trim());
                    double secondNum = Double.parseDouble(textSecondNumber.getText().trim());

                    JOptionPane.showMessageDialog(null, "Result = " + Double.toString(firstNum + secondNum), "Result", JOptionPane.INFORMATION_MESSAGE);

                    textFirstNumber.setText("");
                    textSecondNumber.setText("");
                }
                catch (Exception exp){
                    JOptionPane.showMessageDialog(null, "Not number", "alert", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        btnMinus.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    double firstNum = Double.parseDouble(textFirstNumber.getText().trim());
                    double secondNum = Double.parseDouble(textSecondNumber.getText().trim());

                    JOptionPane.showMessageDialog(null, "Result = " + Double.toString(firstNum - secondNum), "Result", JOptionPane.INFORMATION_MESSAGE);

                    textFirstNumber.setText("");
                    textSecondNumber.setText("");
                }
                catch (Exception exp){
                    JOptionPane.showMessageDialog(null, "Not number", "alert", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        btnDivision.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    double firstNum = Double.parseDouble(textFirstNumber.getText().trim());
                    double secondNum = Double.parseDouble(textSecondNumber.getText().trim());

                    JOptionPane.showMessageDialog(null, "Result = " + Double.toString(firstNum / secondNum), "Result", JOptionPane.INFORMATION_MESSAGE);

                    textFirstNumber.setText("");
                    textSecondNumber.setText("");
                }
                catch (Exception exp){
                    JOptionPane.showMessageDialog(null, "Not number",
                            "alert", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        btnMultiplication.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    double firstNum = Double.parseDouble(textFirstNumber.getText().trim());
                    double secondNum = Double.parseDouble(textSecondNumber.getText().trim());

                    JOptionPane.showMessageDialog(null, "Result = " + Double.toString(firstNum * secondNum), "Result", JOptionPane.INFORMATION_MESSAGE);

                    textFirstNumber.setText("");
                    textSecondNumber.setText("");
                }
                catch (Exception exp){
                    JOptionPane.showMessageDialog(null, "Not number", "alert", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        setVisible(true);
    }

    public static void main(String[]args)
    {
        new SimpleCalculator();
    }
}