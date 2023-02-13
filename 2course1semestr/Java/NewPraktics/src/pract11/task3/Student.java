package pract11.task3;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

public class Student implements Comparable <Student>{

    private Integer iDNumber;
    private Double GPAScore;

    private Date dateOfBirth;

    private SimpleDateFormat dateFormatter;



    public Student(int iDNumber, double GPAScore, String dateOfBirth, int iDateFormat ) throws ParseException {
        this.GPAScore = GPAScore;
        this.iDNumber = iDNumber;
        this.dateOfBirth = new SimpleDateFormat("dd.MM.yyyy").parse(dateOfBirth);
        switch(iDateFormat){
            case 1: dateFormatter = new SimpleDateFormat("E, y-M-d 'at' h:m:s a z"); break;
            case 2: dateFormatter = new SimpleDateFormat("EEEE, d MMMM , yyyy"); break;
            case 3: dateFormatter = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz"); break;
        }
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
        return "Student " + iDNumber + ",GPA score: " + Math.ceil(GPAScore) + ",date of birth: " + dateFormatter.format(dateOfBirth) ;
    }

}
