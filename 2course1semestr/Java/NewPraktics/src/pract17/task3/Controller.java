package pract17.task3;

import javax.naming.ldap.Control;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Controller extends JFrame {

    UserView view;
    Model model;

    Controller() {
        super("something");
        setSize(1080,720);

        model = new Model();
        JPanel tmp = (JPanel) getContentPane();

        view = new UserView(tmp);
        view.setResultText("Enter your name");

        final Integer[] counter = {0};

        ActionListener eventListener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                switch (counter[0]++) {
                    case 0: {
                        model.setName(view.getInputText());
                        view.setResultText("Enter your age");
                        view.clearInput();
                        break;
                    }
                    case 1:{
                        model.setAge(Integer.parseInt(view.getInputText()));
                        view.setResultText("Enter your surname");
                        view.clearInput();
                        break;
                    }
                    case 2:{
                        model.setSurname(view.getInputText());
                        view.setResultText(model.toString());
                        view.clearInput();
                    }
                }
            }
        };

        view.setActionListener(eventListener);

        this.setVisible(true);
    }

    public static void main(String[] args) {
        Controller obj = new Controller();
    }
}
