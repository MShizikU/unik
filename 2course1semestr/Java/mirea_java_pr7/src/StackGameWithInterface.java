import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Stack;

public class StackGameWithInterface extends JFrame implements interfaceGame {

    Stack<Integer> stackRealPlayer = new Stack<Integer>();
    ArrayList<String> stRealPlayerCards = new ArrayList<>();
    Stack<Integer> stackBotPlayer = new Stack<>();

    int iCount = 0;

    JButton btnRestart;
    JButton btnNext;
    JButton btnStop;

    JLabel labelPlayerCards;
    JLabel labelEnemyCards;
    JLabel labelInfo;
    JLabel underLabelInfo;
    JLabel labelCount;

    JPanel[] panels = new JPanel[12];


    public StackGameWithInterface() {
        super("Example");
        setSize(1080,720);
        setLayout(new GridLayout(4, 3));
        for (int i = 0; i < 12; i++) {
            panels[i] = new JPanel();
            panels[i].setLayout(new BorderLayout());
            add(panels[i]);
        }
        btnRestart = new JButton("Заново");
        btnRestart.setFont(new Font("Times New Roman", Font.BOLD, 32));
        btnNext = new JButton("Раздать карты");
        btnNext.setFont(new Font("Times New Roman", Font.BOLD, 32));
        btnStop = new JButton("Закончить");
        btnStop.setFont(new Font("Times New Roman", Font.BOLD, 32));


        labelEnemyCards = new JLabel("Карты противника: ");
        labelEnemyCards.setHorizontalAlignment(JLabel.CENTER);
        labelEnemyCards.setFont(new Font("Times New Roman", Font.BOLD, 16));
        labelPlayerCards = new JLabel("Ваши карты: ");
        labelPlayerCards.setHorizontalAlignment(JLabel.CENTER);
        labelPlayerCards.setFont(new Font("Times New Roman", Font.BOLD, 16));

        labelInfo = new JLabel("Новая игра");
        labelInfo.setFont(new Font("Times New Roman", Font.BOLD, 32));
        labelInfo.setHorizontalAlignment(JLabel.CENTER);
        underLabelInfo = new JLabel("");
        underLabelInfo.setHorizontalAlignment(JLabel.CENTER);
        labelCount  = new JLabel("Ходов: " + iCount);

        labelEnemyCards.setVerticalAlignment(JLabel.CENTER);
        panels[0].add(BorderLayout.NORTH,labelCount);
        panels[1].add(BorderLayout.CENTER,labelEnemyCards);
        panels[4].add(BorderLayout.CENTER,labelInfo);
        panels[4].add(BorderLayout.SOUTH,underLabelInfo);
        panels[7].add(BorderLayout.CENTER,labelPlayerCards);
        panels[9].add(BorderLayout.CENTER,btnStop);
        panels[10].add(BorderLayout.CENTER,btnNext);
        panels[11].add(BorderLayout.CENTER,btnRestart);

        btnNext.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (iCount == 0) {
                    labelInfo.setForeground(Color.black);
                    labelInfo.setText("Новая игра");
                    giveCards();
                    iCount++;
                    labelPlayerCards.setText(prepareTextToOutput(stRealPlayerCards));
                    labelEnemyCards.setText("Карты соперника: " + String.join("",Collections.nCopies(stackBotPlayer.size(),"* ")) + " ");
                    btnNext.setText("Начать");
                } else {
                    labelCount.setText("Ходов: " + iCount);
                    iCount++;
                    labelInfo.setText(stackRealPlayer.peek() + " X " + stackBotPlayer.peek());
                    if (gameComparator(stackRealPlayer.peek(), stackBotPlayer.peek()) < 0) {
                        getTwoCards(stackBotPlayer, stackRealPlayer);
                        stRealPlayerCards.remove(stRealPlayerCards.size()-1);
                        underLabelInfo.setText("Компьюетр берет вашу карту");
                    } else {
                        stRealPlayerCards.remove(stRealPlayerCards.size()-1);
                        stRealPlayerCards.add(0,stackRealPlayer.peek().toString());
                        stRealPlayerCards.add(0,stackBotPlayer.peek().toString());
                        getTwoCards(stackRealPlayer, stackBotPlayer);
                        underLabelInfo.setText("Вы берете карту компьютера");
                    }
                    labelPlayerCards.setText(prepareTextToOutput(stRealPlayerCards));
                    labelEnemyCards.setText("Карты соперника: " + String.join("",Collections.nCopies(stackBotPlayer.size(),"* ")) + " ");
                    if(stackRealPlayer.empty()){

                        labelInfo.setText("Компьютер выиграл");
                        labelInfo.setForeground(Color.red);
                        underLabelInfo.setText("У вас не осталось карт");
                        btnNext.setText("Раздать карты");

                        iCount = 0;

                        stackRealPlayer.clear();
                        stackBotPlayer.clear();
                        stRealPlayerCards.clear();

                    }
                    else if(stackBotPlayer.empty()){

                        labelInfo.setText("Вы выиграли");
                        labelInfo.setForeground(Color.GREEN);
                        btnNext.setText("Раздать карты");
                        underLabelInfo.setText("У компьютера не осталось карт");

                        iCount = 0;

                        stackRealPlayer.clear();
                        stackBotPlayer.clear();
                        stRealPlayerCards.clear();

                    }
                    else if(iCount == 106) {

                        labelInfo.setText("botva");
                        labelInfo.setForeground(Color.MAGENTA);
                        btnNext.setText("Раздать карты");

                        iCount = 0;

                        stackRealPlayer.clear();
                        stackBotPlayer.clear();
                        stRealPlayerCards.clear();

                    }
                }
                if (iCount == 1) {
                    btnNext.setText("Следующий ход");
                }
            }
        });

        btnStop.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                if(stackRealPlayer.size() > stackBotPlayer.size()){
                    labelInfo.setText("Вы выиграли");
                    labelInfo.setForeground(Color.GREEN);
                    underLabelInfo.setText("");
                }
                else if(stackBotPlayer.size() > stackRealPlayer.size()){
                    labelInfo.setText("Компьютер выиграл");
                    labelInfo.setForeground(Color.RED);
                    underLabelInfo.setText("");
                }
                else if(iCount == 106) {
                    labelInfo.setText("botva");
                    labelInfo.setForeground(Color.MAGENTA);
                    underLabelInfo.setText("");
                }
                else{
                    labelInfo.setText("Ничья");
                    labelInfo.setForeground(Color.MAGENTA);
                    underLabelInfo.setText("");
                }

                iCount = 0;

                labelCount.setText("Ходов: " + iCount);
                underLabelInfo.setText("");
                labelEnemyCards.setText("Карты соперника: ");
                labelPlayerCards.setText("Ваши карты: ");
                btnNext.setText("Раздать карты");

                stackRealPlayer.clear();
                stackBotPlayer.clear();
                stRealPlayerCards.clear();
            }
        });

        btnRestart.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                iCount = 0;
                labelCount.setText("Ходов: " + iCount);

                stackRealPlayer.clear();
                stackBotPlayer.clear();
                stRealPlayerCards.clear();

                labelInfo.setText("Новая игра");
                underLabelInfo.setText("");
                labelEnemyCards.setText("Карты соперника: ");
                labelPlayerCards.setText("Ваши карты: ");
                btnNext.setText("Раздать карты");
                labelInfo.setForeground(Color.black);
            }
        });

    }


    public void getTwoCards(Stack<Integer> stackWinner, Stack<Integer> stackLoser) {
        Stack<Integer> tmp = new Stack<>();

        System.out.println("Before");
        System.out.println(stackWinner);
        System.out.println(stackLoser);

        Integer iWinnerCard = stackWinner.pop();
        while (!stackWinner.empty()) {
            tmp.push(stackWinner.pop());
        }
        tmp.push(iWinnerCard);
        tmp.push(stackLoser.pop());
        while (!tmp.empty()) {
            stackWinner.push(tmp.pop());
        }
        System.out.println("After");
        System.out.println(stackWinner);
        System.out.println(stackLoser);
    }

    public void giveCards(){
        ArrayList<Integer> solution = new ArrayList<Integer>();
        for (int i = 0; i <= 9; i++) {
            solution.add(i);
        }
        Collections.shuffle(solution);
        for (int i = 0; i < 5; i++) {
            stackBotPlayer.push(solution.get(i));
        }
        for (int i = 5; i < 10; i++) {
            stackRealPlayer.push(solution.get(i));
            stRealPlayerCards.add(solution.get(i).toString());
        }
    }

    public String prepareTextToOutput(ArrayList<String> alPlayerCards){

        String tmp = "Ваши карты: ";
        for (int i = 0; i < alPlayerCards.size(); i++){
            tmp += alPlayerCards.get(i) + " ";
        }
        return tmp;

    }


}
