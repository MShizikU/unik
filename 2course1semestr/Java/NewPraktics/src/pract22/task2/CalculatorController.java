package pract22.task2;

import pract22.task1.Calculator;
import pract22.task1.DivisionByZeroException;
import pract22.task1.EmptyStackException;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CalculatorController extends JFrame {

    public CalculatorController(){
        super("calculator");
        setSize(200,300);

        CalculatorView view = new CalculatorView((JPanel) getContentPane());

        CalculatorModel model = new CalculatorModel();

        ActionListener btnActionListenter = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (e.getActionCommand().charAt(0) == '='){
                    model.setUserInput(view.getUserInput());
                    try {
                        model.fromPolandToNormal();
                    } catch (EmptyStackException ex) {
                        clear(model, view);
                        view.showAlertDialog(ex.getMessage());
                    } catch (DivisionByZeroException ex) {
                        clear(model, view);
                        view.showAlertDialog(ex.getMessage());
                    } catch (EmptyStringException ex) {
                        clear(model, view);
                        view.showAlertDialog(ex.getMessage());
                    } catch (DoubleParseException ex) {
                        clear(model,view);
                        view.showAlertDialog(ex.getMessage());
                    }

                    view.setTextUserInputField(model.getResult());
                }
                else if(e.getActionCommand().charAt(0) == 'C'){
                    clear(model, view);
                }
                else if(e.getActionCommand().charAt(0) == '.'){
                    if (view.getUserInput().length() != 0 && model.isOperand(((Character)view.getUserInput().charAt(view.getUserInput().length()-1)).toString())){
                        view.showAlertDialog("Wrong place for dot! Retry with another expression");
                        clear(model,view);
                    }
                    view.setTextUserInputField(view.getUserInput() + e.getActionCommand());
                }
                else if(view.getUserInput().length()==0 && e.getActionCommand().charAt(0) == '.'){
                    view.showAlertDialog("Wrong place for dot! Retry with another expression");
                }
                else if(view.getUserInput().length()!= 0 && view.getUserInput().charAt(view.getUserInput().length()-1) == '.'){
                    view.setTextUserInputField(view.getUserInput() + e.getActionCommand());
                }
                else{
                    view.setTextUserInputField(view.getUserInput()+ " " + e.getActionCommand());
                }
            }
        };

        view.setActionListener(btnActionListenter);

        setVisible(true);

    }

    private void clear(CalculatorModel model, CalculatorView view){
        model.setResult("");
        model.setUserInput("");
        view.setTextUserInputField("");
    }
}
