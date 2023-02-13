package pract10;

public class Student implements Comparable<Student>{

    private String stName;
    private String stSurname;
    private String stSpeciality;
    private Integer iCourse;

    private Integer GPAScore = 0;

    private Integer CompareMethods = 0;
    private String stGroup;

    public Student(String stName, String stSurname, String stSpeciality, Integer iCourse, String stGroup, Integer GPAScore, Integer CompareMethods) {
        this.stName = stName;
        this.stSurname = stSurname;
        this.stSpeciality = stSpeciality;
        this.iCourse = iCourse;
        this.stGroup = stGroup;
        this.GPAScore = GPAScore;
        this.CompareMethods = CompareMethods;
    }

    public Student(String stName, String stSurname, String stSpeciality, Integer iCourse, String stGroup, Integer GPAScore) {
        this.stName = stName;
        this.stSurname = stSurname;
        this.stSpeciality = stSpeciality;
        this.iCourse = iCourse;
        this.stGroup = stGroup;
        this.GPAScore = GPAScore;
        this.CompareMethods = 1;
    }

    public String getName() {
        return stName;
    }

    public void setName(String stName) {
        this.stName = stName;
    }

    public String getSurname() {
        return stSurname;
    }

    public void setSurname(String stSurname) {
        this.stSurname = stSurname;
    }

    public String getSpeciality() {
        return stSpeciality;
    }

    public void setSpeciality(String stSpeciality) {
        this.stSpeciality = stSpeciality;
    }

    public Integer getCourse() {
        return iCourse;
    }

    public void setCourse(Integer iCourse) {
        this.iCourse = iCourse;
    }

    public String getGroup() {
        return stGroup;
    }

    public void setGroup(String stGroup) {
        this.stGroup = stGroup;
    }

    @Override
    public int compareTo(Student second) {
        if (CompareMethods == 1){
            return this.GPAScore - second.GPAScore;
        }
        else if (CompareMethods == 2){
            return this.iCourse - second.iCourse;
        }
        return 0;
    }

    @Override
    public String toString(){
        return "Student: " +
               stName + ", " +
               stSurname + ", " +
               stGroup + ", " +
               stSpeciality + ", " +
               iCourse + ", " +
               GPAScore;
    }
}
