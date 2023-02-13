package pract19.task2;

import javax.swing.*;
import javax.swing.event.MouseInputListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class LabClassUI extends JFrame {
    ArrayList<Student> students;


    public LabClassUI(ArrayList<Student> students){
        super("Students table");
        setSize(1080,720);

        this.students = students;

        JPanel panelMain = new JPanel(new FlowLayout());

        JButton btnAddStudent = new JButton("Add");
        JButton btnRemoveStudent = new JButton("Remove");
        JButton btnFindStudent = new JButton("Find");

        panelMain.add(btnAddStudent);
        panelMain.add(btnRemoveStudent);
        panelMain.add(btnFindStudent);

        Object[] headers = new String[] {"Name", "Surname", "Speciality", "Course", "Group", "GPA score"};
        Object [][] arStudents = new String[students.size()][6];

        for(int i = 0; i < students.size(); i++){
            arStudents[i][0] = students.get(i).getName();
            arStudents[i][1] = students.get(i).getSurname();
            arStudents[i][2] = students.get(i).getSpeciality();
            arStudents[i][3] = students.get(i).getCourse().toString();
            arStudents[i][4] = students.get(i).getGroup();
            arStudents[i][5] = students.get(i).getGPAScore().toString();
        }


        JTable tableStudents = new JTable( new DefaultTableModel(arStudents, headers)){
            @Override
            public boolean isCellEditable(int x, int y){
                return false;
            }
        };

        JTableHeader header = tableStudents.getTableHeader();
        header.setReorderingAllowed(false);
        header.setResizingAllowed(false);


        header.addMouseListener(new MouseInputListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int count = e.getClickCount();
                if (count == 2){
                    if(header.getHeaderRect(2).contains(e.getX(), e.getY()))
                        sortStudents(new ComparatorBySpeciality(),tableStudents);
                    if(header.getHeaderRect(3).contains(e.getX(), e.getY()))
                        sortStudents(new ComparatorByCourse(), tableStudents);
                    if(header.getHeaderRect(4).contains(e.getX(), e.getY()))
                        sortStudents(new ComparatorByCourse(), tableStudents);
                    if(header.getHeaderRect(5).contains(e.getX(), e.getY()))
                        sortStudents(new CompareByGpa(), tableStudents);
                }
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }

            @Override
            public void mouseDragged(MouseEvent e) {

            }

            @Override
            public void mouseMoved(MouseEvent e) {

            }
        });


        btnAddStudent.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    addStudent(tableStudents);
                }catch (IllegalArgumentException exception){
                    JOptionPane.showMessageDialog(panelMain, exception.getMessage());
                }
            }
        });

        btnRemoveStudent.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                removeStudent(tableStudents);
            }
        });

        btnFindStudent.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    findStudent();
                }catch (StudentNotFoundException ex){
                    JOptionPane.showMessageDialog(getContentPane(), ex.getMessage());
                }
            }
        });




        add(new JScrollPane(tableStudents), BorderLayout.CENTER);

        add(panelMain, BorderLayout.NORTH);

        setVisible(true);
    }


    private void sortStudents(Comparator<Student> comp, JTable tableStudents){
        Student temp;

        students.sort(comp);

        DefaultTableModel dtm = (DefaultTableModel) tableStudents.getModel();

        for (int i = 0; i < students.size(); i++) {
            dtm.removeRow(i);
            Student student = students.get(i);
            dtm.insertRow(i, new Object[]{student.getName(), student.getSurname(), student.getSpeciality(), student.getCourse(), student.getGroup(), student.getGPAScore()});
        }
    }

    private void findStudent() throws StudentNotFoundException {
        String s = JOptionPane.showInputDialog("Введите искомую Фамилию");
        for(int i = 0; i < students.size(); i++){
            if(students.get(i).getSurname().equals(s)){
                JOptionPane.showMessageDialog(this, "Student was found: "+ students.get(i).toString());
                return;
            }
        }
        throw new StudentNotFoundException();
    }

    private void removeStudent(JTable studTable) {
        int c = studTable.getSelectedRowCount();
        if(c != 1) {
            JOptionPane.showMessageDialog(this, "Выберете ровно одну строку!");
            return;
        }
        c = studTable.getSelectedRow();
        students.remove(c);
        DefaultTableModel dtm = (DefaultTableModel) studTable.getModel();

        dtm.removeRow(c);

    }

    private void addStudent(JTable tableStudents) throws IllegalArgumentException {
        String stName = JOptionPane.showInputDialog("Enter student name");
        String stSurname = JOptionPane.showInputDialog("Enter student surname");
        String stSpeciality = JOptionPane.showInputDialog("Enter speciality");
        String stGroup = JOptionPane.showInputDialog("Enter group");

        String stCourse = JOptionPane.showInputDialog("Enter course number");
        String stGPAScore = JOptionPane.showInputDialog("Enter GPA score");

        if (stName.equals("") || stSurname.equals("") || stSpeciality.equals("") || stGroup.equals("")) throw new EmptyStringException();

        int iCourse, iGPAScore;

        try {

            iCourse = Integer.parseInt(stCourse);
            iGPAScore = Integer.parseInt(stGPAScore);

        }
        catch (NumberFormatException e){
            throw new NumberFormatException("Введенный формат не преобразуем");
        }

        students.add(new Student(stName, stSurname, stSpeciality, iCourse, stGroup, iGPAScore));

        DefaultTableModel dtm = (DefaultTableModel) tableStudents.getModel();

        dtm.addRow(new Object[]{stName, stSurname, stSpeciality, iCourse, stGroup, iGPAScore});
    }

}
