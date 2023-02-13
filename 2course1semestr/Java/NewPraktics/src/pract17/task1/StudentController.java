package pract17.task1;

public class StudentController {

    Student model;
    StudentView view;

    StudentController(Student tmp){
        model = tmp;
        view = new StudentView();
    }

    public void setStudentName(String name){
        model.setName(name);
    }

    public String getStudentName(){
        return model.getName();
    }

    public void setStudentRollNo(String rollNo){
        model.setRollNo(rollNo);
    }

    public String getStudentRollNo(String rollNo){
        return model.getRollNo();
    }

    public void updateView(){
        view.printStudentDetails(model.getName(),model.getRollNo());
    }

}
