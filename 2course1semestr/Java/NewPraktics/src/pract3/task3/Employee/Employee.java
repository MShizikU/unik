package pract3.task3.Employee;

public class Employee {
    String stFullName;
    double dSalary;

    public Employee(String stFullName, double dSalary){
        this.stFullName = stFullName;
        this.dSalary = dSalary;
    }

    public String getFullName() {
        return stFullName;
    }

    public double getSalary() {
        return dSalary;
    }
}
