import java.util.ArrayList;

public class testClassInsertionSort {

    Student[] StudentsList;

    public void fillStudentsList(int length){
        StudentsList = new Student[length];
        for(int i = 0 ; i < length; i++){
            StudentsList[i] = (new Student((int)(Math.random()*length)+1));
        }
    }

    public void insertionSortStudentsList(){

        for (int left = 1; left < StudentsList.length; left++) {
            Student value = StudentsList[left];
            int i = left -1;
            while (i>=0 && StudentsList[i].compareTo(value) >= 0) {
                StudentsList[i + 1] = StudentsList[i];
                i -=1;
            }
            StudentsList[i + 1] = value;
        }

    }

}
