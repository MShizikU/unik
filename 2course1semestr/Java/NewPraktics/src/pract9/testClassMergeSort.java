package pract9;

import java.lang.reflect.Array;
import java.util.Arrays;

import static java.lang.System.arraycopy;

public class testClassMergeSort {

    Student[] StudentsListFirst;
    Student[] StudentsListSecond;


    private void fillStudentLists(int length_first, int length_second){
        StudentsListFirst = new Student[length_first];
        StudentsListSecond = new Student[length_second];

        for(int i = 0 ; i < length_first; i++){
            StudentsListFirst[i] = new Student((int)(Math.random()*length_first+1),(double) (Math.random()*1000));
        }

        for(int i = 0 ; i < length_second; i++){
            StudentsListSecond[i] = new Student((int)(Math.random()*length_first+1),(double) (Math.random()*1000));
        }
    }

    private Student[] mergeSort(Student[] StudentsList){
        if (StudentsList == null ){
            return null;
        }

        if(StudentsList.length <2){
            return StudentsList;
        }

        Student [] StudentsListLeft = new Student[StudentsList.length / 2];
        arraycopy(StudentsList, 0, StudentsListLeft, 0, StudentsList.length / 2);

        Student [] StudentsListRight = new Student[StudentsList.length - StudentsList.length / 2];
        arraycopy(StudentsList, StudentsList.length / 2, StudentsListRight, 0, StudentsList.length - StudentsList.length / 2);

        StudentsListLeft = mergeSort(StudentsListLeft);
        StudentsListRight = mergeSort(StudentsListRight);

        return mergeArrays(StudentsListLeft, StudentsListRight);

    }

    private Student[] mergeArrays(Student[] StudentsListLeft, Student[] StudentsListRight) {

        Student[] StudentsListFinal = new Student[StudentsListLeft.length + StudentsListRight.length];

        int posLeft = 0, posRight = 0, curPos = 0;

        while(posLeft < StudentsListLeft.length && posRight < StudentsListRight.length) {

            StudentsListFinal[curPos++] = StudentsListLeft[posLeft].compareTo(StudentsListRight[posRight]) < 0 ? StudentsListLeft[posLeft++] : StudentsListRight[posRight++];

        }

        if(posLeft< StudentsListLeft.length) {

            arraycopy(StudentsListLeft, posLeft, StudentsListFinal, curPos, StudentsListLeft.length - posLeft);

        }
        else if(posRight< StudentsListRight.length) {

            arraycopy(StudentsListRight, posRight, StudentsListFinal, curPos, StudentsListRight.length - posRight);

        }

        return StudentsListFinal;
    }

    public void execute(int length_first, int length_second){
        fillStudentLists(length_first,length_second);
        System.out.println(Arrays.toString(StudentsListFirst));
        System.out.println(Arrays.toString(StudentsListSecond));
        StudentsListFirst = mergeSort(StudentsListFirst);
        StudentsListSecond = mergeSort(StudentsListSecond);
        System.out.println(Arrays.toString(mergeArrays(StudentsListFirst,StudentsListSecond)));
    }

}
