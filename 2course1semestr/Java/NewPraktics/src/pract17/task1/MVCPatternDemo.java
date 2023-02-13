package pract17.task1;

public class MVCPatternDemo {

    public static void main(String[] args) {
        StudentController controller = new StudentController(retreiveStudentFromDatabase());
        controller.updateView();
    }

    public static Student retreiveStudentFromDatabase(){
        Student tmp = new Student();
        tmp.setName("Viktor");
        tmp.setRollNo("TMP");
        return tmp;
    }

}
