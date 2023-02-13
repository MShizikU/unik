import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class prakt4 extends JFrame {

    private String stRM = "Real Madrid";
    private String stAM = "AC Milan";

    private int iScoreMilan = 0;
    private int iScoreMadrid = 0;

    JButton btnMilan = new JButton("AC Milan");
    JButton btnMadrid = new JButton("Real Madrid");
    JLabel labelResult = new JLabel("Result: 0 X 0",SwingConstants.CENTER);
    JLabel labelLast = new JLabel("Last scorer: None",SwingConstants.CENTER);
    JLabel labelWinner = new JLabel("Winner: None",SwingConstants.CENTER);

    public prakt4(){
        super("Praktice4");
        setLayout(new BorderLayout());
        add(btnMadrid,BorderLayout.WEST);
        add(btnMilan,BorderLayout.EAST);
        add(labelWinner,BorderLayout.NORTH);
        add(labelLast,BorderLayout.SOUTH);
        add(labelResult,BorderLayout.CENTER);
        this.setExtendedState(JFrame.MAXIMIZED_BOTH);

        labelWinner.setFont(new Font("Serif", Font.PLAIN,28));
        labelWinner.setForeground(Color.BLACK);
        labelLast.setFont(new Font("Serif", Font.PLAIN,16));
        labelResult.setFont(new Font("Serif", Font.PLAIN,48));

        btnMadrid.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                iScoreMadrid++;
                updateInterface(stRM);
            }
        });

        btnMilan.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                iScoreMilan++;
                updateInterface(stAM);
            }
        });
    }

    private void updateInterface(String scorer){
        labelLast.setText("Last scorer: " + scorer);
        labelResult.setText("Result: " + iScoreMadrid + " X " + iScoreMilan);
        if(iScoreMadrid > iScoreMilan){
            labelWinner.setForeground(Color.BLUE);
            labelWinner.setText("Winner: " + stRM);
        } else if(iScoreMilan > iScoreMadrid){
            labelWinner.setForeground(Color.RED);
            labelWinner.setText("Winner: " + stAM);
        } else{
            labelWinner.setForeground(Color.GRAY);
            labelWinner.setText("Winner: Draw");
        }
    }

    public static void main(String[] args){
        new prakt4().setVisible(true);
    }

}
