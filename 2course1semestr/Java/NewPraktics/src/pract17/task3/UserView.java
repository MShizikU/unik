package pract17.task3;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;

public class UserView {

    JPanel mainFrame;

    JLabel textResult;
    JTextArea textInput;

    JButton btnUserInputs;

    JPanel[] panels;

    UserView(JPanel mainFrame){
        this.mainFrame = mainFrame;
        mainFrame.setLayout(new GridLayout(3,1));

        panels = new JPanel[3];

        panels[0] = new JPanel();
        panels[1] = new JPanel();
        panels[2] = new JPanel();

        this.mainFrame.add(panels[0]);
        this.mainFrame.add(panels[1]);
        this.mainFrame.add(panels[2]);

        panels[0].setBackground(Color.white);
        panels[1].setBackground(Color.white);
        panels[2].setBackground(Color.white);

        textResult = new JLabel();
        textResult.setFont(new Font("Times new roman", Font.BOLD, 24));
        panels[0].add(textResult);

        textInput = new JTextArea();
        textInput.setFont(new Font("Times new roman", Font.BOLD,24));
        panels[1].add(textInput);

        btnUserInputs = new JButton("Enter");
        panels[2].add(btnUserInputs);


    }

    public void setActionListener(ActionListener eventListener){
        btnUserInputs.addActionListener(eventListener);
    }

    public String getInputText(){
        return textInput.getText().toString();
    }

    public void setResultText(String str){
        textResult.setText(str);
    }

    public void clearInput(){
        textInput.setText("");
    }

}
