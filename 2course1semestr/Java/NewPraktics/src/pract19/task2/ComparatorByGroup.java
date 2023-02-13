package pract19.task2;

import java.util.Comparator;

public class ComparatorByGroup implements Comparator<Student> {
    @Override
    public int compare(Student first, Student second){
        return first.getGroup().compareTo(second.getGroup());
    }
}
