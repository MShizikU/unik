package pract17.task2;

public class EmployeeController {

    Employee model;
    EmployeeView view;

    public EmployeeController() {
        this.model = new Employee();
        view = new EmployeeView();
    }

    public void setEmployeeName(String name){
        model.setName(name);
    }

    public String getEmployeeName(String name){
        return model.getName();
    }

    public void setEmployeeHourPayment(Integer payment){
        model.setHourPayment(payment);
    }

    public void setEmployeeHours(Integer hours){
        model.setHours(hours);
    }

    public String getEmployeeHourPayment(){
        return model.getHourPayment().toString();
    }

    public String getEmployeeHours(){
        return model.getHours().toString();
    }

    public void updateView(){
        view.displayDataEmployee(model.getName(), model.getSalary().toString());
    }
}
