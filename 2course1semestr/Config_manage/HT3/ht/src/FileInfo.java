import java.util.ArrayList;

public class FileInfo {
    ArrayList<String> groups;
    ArrayList<Student> students;
    String subject;

    FileInfo(){
        groups = new ArrayList<>();
        students = new ArrayList<>();
        subject = "";
    }

    public ArrayList<String> getGroups(){
        return groups;
    }

    public ArrayList<Student> getStudents(){
        return students;
    }

    public String getSubject(){
        return subject;
    }

}
