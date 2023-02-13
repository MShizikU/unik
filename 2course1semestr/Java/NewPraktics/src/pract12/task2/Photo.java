package pract12.task2;

import javax.imageio.ImageIO;
import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.io.File;
import java.io.IOException;


class Photo extends JFrame {



    public Photo(String[] args) throws IOException {

        super("Photo Viewer");
        getContentPane().setBackground(Color.black);
        setLayout(new FlowLayout());
        setSize(1920,1080);


        JLabel label = new JLabel();
        add(label);
        label.setLocation(960, 540);

        String src = args[0];
        System.out.println(src);

        try{
            Image photo = ImageIO.read( new File( src));
            label.setIcon(new ImageIcon(photo));
            label.setLocation(960, 540);
        }
        catch(Exception exp){
            JOptionPane.showMessageDialog(null, "Not string",
                    "alert", JOptionPane.ERROR_MESSAGE);
        }

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    public static void main(String[] args) throws Exception {
        new Photo(args);
    }
}