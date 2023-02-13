package pract19.task2;

import java.util.Comparator;

public class CompareByGpa implements Comparator<Student> {
    @Override
    public int compare(Student first, Student second){
        return first.getGPAScore() - second.getGPAScore();
    }
}
