package pract17.task2;

public class Test {
    public static void main(String[] args) {
        EmployeeController controller = new EmployeeController();
        retreiveDataFromDatabase(controller);
        controller.updateView();
    }

    public static void retreiveDataFromDatabase(EmployeeController controller){
        controller.setEmployeeHours(168);
        controller.setEmployeeHourPayment(1000);
        controller.setEmployeeName("Viktor");
    }
}
