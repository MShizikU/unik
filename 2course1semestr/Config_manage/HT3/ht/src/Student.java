public class Student {
    Integer iAge;
    String stGroupNumber;
    String stName;

    public Integer getAge(){
        return iAge;
    }

    public String getGroup(){
        return stGroupNumber;
    }

    public String getName(){
        return stName;
    }

    Student(Integer Age, String group, String name){
        this.iAge = Age;
        this.stGroupNumber = group;
        this.stName = name;
    }

}
