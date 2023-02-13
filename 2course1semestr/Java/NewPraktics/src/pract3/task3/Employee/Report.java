package pract3.task3.Employee;

import java.util.ArrayList;
import java.util.Formatter;
import java.util.Scanner;

public class Report {



    public Report(int iLength, ArrayList<Employee> alEmployee){
        for(int i =0; i < iLength; i++){
            alEmployee.add(new Employee("TMP name", (i+1)*10000 ));
        }
    }

    public static void generateReport(ArrayList<Employee> listOfEmployees){
        Scanner scanner = new Scanner(System.in);
        Formatter formatter = new Formatter();

        for (Employee employee : listOfEmployees) {
            formatter.format("%-30s %10.2f \n", employee.getFullName(), employee.getSalary());
        }
        System.out.println(formatter);
    }

    public static void main(String[] args) {
        ArrayList<Employee> alEmployee = new ArrayList<>();
       Report report =  new Report(10, alEmployee);
       report.generateReport(alEmployee);
    }
}
