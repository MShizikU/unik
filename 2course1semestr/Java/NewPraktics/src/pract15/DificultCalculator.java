package pract15;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class DificultCalculator extends JFrame {



    DificultCalculator(){
        super("calculator");
        setSize(200,300);
        setMaximumSize(new Dimension(200,300));
        final String[] s0 = {""};
        final String[] s1 = {""};
        final String[] s2 = {""};

        JTextField textUserInput = new JTextField(16);
        textUserInput.setEditable( false);
        textUserInput.setBackground(Color.white);

        JButton btnZero,
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

        JPanel panelMain = new JPanel();

        ActionListener btnActionListenter = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String s = e.getActionCommand();
                if ((s.charAt(0) >= '0' && s.charAt(0) <= '9') || s.charAt(0) == '.') {
                    if (!s1[0].equals(""))
                        s2[0] += s;
                    else {
                        s0[0] = s0[0] + s;
                    }
                    textUserInput.setText(s0[0] + s1[0] + s2[0]);
                }
                else if (s.charAt(0) == 'C') {
                    s0[0] = s1[0] = s2[0] = "";
                    textUserInput.setText(s0[0] + s1[0] + s2[0]);
                }
                else if (s.charAt(0) == '=') {

                    double te;
                    if (s1[0].equals("+"))
                        te = (Double.parseDouble(s0[0]) + Double.parseDouble(s2[0]));
                    else if (s1[0].equals("-"))
                        te = (Double.parseDouble(s0[0]) - Double.parseDouble(s2[0]));
                    else if (s1[0].equals("/"))
                        te = (Double.parseDouble(s0[0]) / Double.parseDouble(s2[0]));
                    else
                        te = (Double.parseDouble(s0[0]) * Double.parseDouble(s2[0]));

                    textUserInput.setText(s0[0] + s1[0] + s2[0] + "=" + te);

                    s0[0] = Double.toString(te);

                    s1[0] = s2[0] = "";
                }
                else {
                    if (s1[0].equals("") || s2[0].equals(""))
                        s1[0] = s;
                    else {
                        double te;

                        if (s1[0].equals("+"))
                            te = (Double.parseDouble(s0[0]) + Double.parseDouble(s2[0]));
                        else if (s1[0].equals("-"))
                            te = (Double.parseDouble(s0[0]) - Double.parseDouble(s2[0]));
                        else if (s1[0].equals("/"))
                            te = (Double.parseDouble(s0[0]) / Double.parseDouble(s2[0]));
                        else
                            te = (Double.parseDouble(s0[0]) * Double.parseDouble(s2[0]));

                        s0[0] = Double.toString(te);

                        s1[0] = s;

                        s2[0] = "";
                    }
                    textUserInput.setText(s0[0] + s1[0] + s2[0]);
                }
            }
        };

        btnMultiply.addActionListener(btnActionListenter);
        btnDevide.addActionListener(btnActionListenter);
        btnMinus.addActionListener(btnActionListenter);
        btnPlus.addActionListener(btnActionListenter);
        btnNine.addActionListener(btnActionListenter);
        btnEight.addActionListener(btnActionListenter);
        btnSeven.addActionListener(btnActionListenter);
        btnSix.addActionListener(btnActionListenter);
        btnFive.addActionListener(btnActionListenter);
        btnFour.addActionListener(btnActionListenter);
        btnThree.addActionListener(btnActionListenter);
        btnTwo.addActionListener(btnActionListenter);
        btnOne.addActionListener(btnActionListenter);
        btnZero.addActionListener(btnActionListenter);
        btnDot.addActionListener(btnActionListenter);
        btnClear.addActionListener(btnActionListenter);
        btnResult.addActionListener(btnActionListenter);

        panelMain.add(textUserInput);
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
        add(panelMain);
    }

    public static void main(String[] args) {
        new DificultCalculator().setVisible(true);
    }

}
