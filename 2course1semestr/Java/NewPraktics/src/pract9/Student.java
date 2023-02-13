package pract9;

import java.util.Objects;

public class Student implements Comparable <Student>{

    private Integer iDNumber;
    private Double GPAScore;

    public Student(int iDNumber){
        this.iDNumber = iDNumber;
        this.GPAScore = 0.0;
    }


    public Student(int iDNumber, double GPAScore){
        this.GPAScore = GPAScore;
        this.iDNumber = iDNumber;
    }

    @Override
    public int compareTo(Student second){
        if(Objects.equals(this.GPAScore, second.GPAScore)) {
            return this.iDNumber - second.iDNumber;
        }else{
            return (int)(Math.ceil(this.GPAScore) - Math.ceil(second.GPAScore));
        }

    }

    @Override
    public String toString(){
        return "Student " + iDNumber + ",GPA score: " + Math.ceil(GPAScore);
    }

}
