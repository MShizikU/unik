import jdk.jshell.spi.ExecutionControl;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class ThirdVariant extends JFrame {


    public ThirdVariant() throws Exception {

        super("Animation");
        setLayout(new BorderLayout());
        setSize(1920, 1080);
        this.getContentPane().setBackground( Color.BLACK );


        Image[] frames = {
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-0.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-1.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-2.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-3.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-4.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-5.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-6.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-7.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-8.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-9.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-10.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-11.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-12.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-13.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-14.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-15.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-16.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-17.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-18.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-19.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-20.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-21.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-22.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-23.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-24.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-25.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-26.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-27.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-28.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-29.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-30.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-31.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-32.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-33.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-34.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-35.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-36.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-37.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-37.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-38.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-39.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-40.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-41.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-42.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-43.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-44.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-45.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-46.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-47.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-48.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-49.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-50.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-51.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-52.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-53.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-54.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-55.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-56.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-57.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-58.png")),
                ImageIO.read(new File("C:/Users/sidor/Desktop/unik/Java/mirea_java_lb5/src/image/9gu9-59.png"))
        };

        BufferedImage img = null;

        JToggleButton btn = new JToggleButton("Start");
        btn.setBackground(Color.BLACK);
        btn.setForeground(Color.gray);
        btn.setFocusPainted(false);
        btn.setFont(new Font("Times New Roman", Font.BOLD, 32));
        JPanel jp = new JPanel(new BorderLayout());
        JLabel label = new JLabel(new ImageIcon(frames[0]));
        add(label, BorderLayout.CENTER);
        jp.add(btn, BorderLayout.CENTER);
        add(jp, BorderLayout.NORTH);

        ActionListener animate = new ActionListener() {

            public int index = 0;

            @Override
            public void actionPerformed(ActionEvent e) {
                if (index < frames.length - 1) {
                    index++;
                } else {
                    index = 0;
                }
                label.setIcon(new ImageIcon(frames[index]));
            }
        };
        final Timer timer = new Timer(25, animate);
        Border emptyBorder = BorderFactory.createEmptyBorder();
        btn.setBorder(emptyBorder);

        btn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (btn.isSelected()) {
                    btn.setText("Stop");
                    timer.start();
                    btn.setForeground(Color.WHITE);
                } else {
                    btn.setText("Start");
                    timer.stop();
                    btn.setForeground(Color.gray);
                }

            }
        });
        UIManager.put("ToggleButton.select", Color.BLACK);
        SwingUtilities.updateComponentTreeUI(btn);
    }

    public static void main(String[] args) throws Exception {
        new ThirdVariant().setVisible(true);
    }
}
