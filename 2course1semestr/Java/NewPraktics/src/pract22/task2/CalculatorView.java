package pract22.task2;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;

public class CalculatorView {

    private JPanel panelMainFrame;

    private JButton btnZero,
            btnOne,
            btnTwo,
            btnThree,
            btnFour,
            btnFive,
            btnSix,
            btnSeven,
            btnEight,
            btnNine,
            btnPlus,
            btnMinus,
            btnDevide,
            btnMultiply,
            btnDot,
            btnClear,
            btnResult;

    private JTextField textUserInputField;

    public CalculatorView(JPanel panelMainFrame){
        this.panelMainFrame = panelMainFrame;

        panelMainFrame.setSize(200,300);
        panelMainFrame.setMaximumSize(new Dimension(200,300));

        btnZero = new JButton("0");
        btnZero.setBackground(Color.WHITE);
        btnOne = new JButton("1");
        btnOne.setBackground(Color.WHITE);
        btnTwo = new JButton("2");
        btnTwo.setBackground(Color.WHITE);
        btnThree = new JButton("3");
        btnThree.setBackground(Color.WHITE);
        btnFour = new JButton("4");
        btnFour.setBackground(Color.WHITE);
        btnFive = new JButton("5");
        btnFive.setBackground(Color.WHITE);
        btnSix = new JButton("6");
        btnSix.setBackground(Color.WHITE);
        btnSeven = new JButton("7");
        btnSeven.setBackground(Color.WHITE);
        btnEight = new JButton("8");
        btnEight.setBackground(Color.WHITE);
        btnNine = new JButton("9");
        btnNine.setBackground(Color.WHITE);

        btnResult = new JButton("=");
        btnResult.setBackground(Color.WHITE);

        btnPlus = new JButton("+");
        btnPlus.setBackground(Color.WHITE);
        btnMinus = new JButton("-");
        btnMinus.setBackground(Color.WHITE);
        btnDevide = new JButton("/");
        btnDevide.setBackground(Color.WHITE);
        btnMultiply = new JButton("*");
        btnMultiply.setBackground(Color.WHITE);
        btnClear = new JButton("C");
        btnClear.setBackground(Color.WHITE);

        btnDot = new JButton(".");
        btnDot.setBackground(Color.WHITE);

        textUserInputField = new JTextField(16);
        textUserInputField.setEditable( false);
        textUserInputField.setBackground(Color.white);

        JPanel panelMain = new JPanel();

        panelMain.add(textUserInputField);
        panelMain.add(btnPlus);
        panelMain.add(btnOne);
        panelMain.add(btnTwo);
        panelMain.add(btnThree);
        panelMain.add(btnMinus);
        panelMain.add(btnFour);
        panelMain.add(btnFive);
        panelMain.add(btnSix);
        panelMain.add(btnMultiply);
        panelMain.add(btnSeven);
        panelMain.add(btnEight);
        panelMain.add(btnNine);
        panelMain.add(btnDevide);
        panelMain.add(btnDot);
        panelMain.add(btnZero);
        panelMain.add(btnClear);
        panelMain.add(btnResult);

        panelMain.setBackground(Color.GRAY);
        panelMainFrame.add(panelMain);
    }

    public void setActionListener(ActionListener actionListener){
        btnMultiply.addActionListener(actionListener);
        btnDevide.addActionListener(actionListener);
        btnMinus.addActionListener(actionListener);
        btnPlus.addActionListener(actionListener);
        btnNine.addActionListener(actionListener);
        btnEight.addActionListener(actionListener);
        btnSeven.addActionListener(actionListener);
        btnSix.addActionListener(actionListener);
        btnFive.addActionListener(actionListener);
        btnFour.addActionListener(actionListener);
        btnThree.addActionListener(actionListener);
        btnTwo.addActionListener(actionListener);
        btnOne.addActionListener(actionListener);
        btnZero.addActionListener(actionListener);
        btnDot.addActionListener(actionListener);
        btnClear.addActionListener(actionListener);
        btnResult.addActionListener(actionListener);
    }

    public String getUserInput(){
        return textUserInputField.getText();
    }

    public void setTextUserInputField(String text){
        textUserInputField.setText(text);
    }

    public void showAlertDialog(String message){
        JOptionPane.showMessageDialog(panelMainFrame, message);
    }
}
