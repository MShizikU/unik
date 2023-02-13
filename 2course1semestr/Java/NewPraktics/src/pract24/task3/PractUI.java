package pract24.task3;

import javax.swing.*;
import java.awt.*;
import java.util.Random;

public class PractUI extends JFrame {

    IDocument currentDocument;
    ICreateDocument fabricDocument;

    public PractUI(){
        super("Show Text Document");
        setSize(540,360);

        fabricDocument = new CreateTextDocument();
        currentDocument = fabricDocument.CreateNew("DocFolder1", "Doc1", 90);

        JTextArea textArea = new JTextArea();

        add(textArea);

        JMenuBar menuBarMain = new JMenuBar();
        menuBarMain.setBackground(Color.WHITE);

        JMenu menuFile = new JMenu("File");

        JMenuItem itemNew = new JMenuItem("New");
        JMenuItem itemOpen = new JMenuItem("Open");
        JMenuItem itemSave = new JMenuItem("Save");
        JMenuItem itemExit = new JMenuItem("Exit");

        menuFile.add(itemNew);
        menuFile.add(itemOpen);
        menuFile.add(itemSave);
        menuFile.add(itemExit);

        menuBarMain.add(menuFile);
        setJMenuBar(menuBarMain);

        itemNew.addActionListener(e -> {
            textArea.setText("");
            String stDocumentName = JOptionPane.showInputDialog("Enter document name");
            if (stDocumentName == null) return;
            String stDocumentFolder = JOptionPane.showInputDialog("Enter document folder");
            if (stDocumentFolder == null) return;

            currentDocument = fabricDocument.CreateNew(stDocumentFolder, stDocumentName, new Random().nextInt(1,100));
        });

        itemOpen.addActionListener(e ->{
            String documentName = JOptionPane.showInputDialog("Enter file name");
            if(documentName == null) return;

            currentDocument = fabricDocument.CreateOpen(documentName);
            textArea.setText(currentDocument.getContent());
        });

        itemSave.addActionListener( e -> {
            JOptionPane.showMessageDialog(getContentPane(), "Document was saved");
            currentDocument.setContent(textArea.getText().toString());
        });

        itemExit.addActionListener(e->{
            this.dispose();
        });


        setVisible(true);

    }

    public static void main(String[] args) {
        new PractUI();
    }
}
