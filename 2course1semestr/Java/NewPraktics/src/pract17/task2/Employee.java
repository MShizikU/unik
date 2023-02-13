package pract17.task2;

public class Employee {

    String stName;
    Integer iHours;

    Integer iHourPayment;

    public Integer getHourPayment() {
        return iHourPayment;
    }

    public void setHourPayment(Integer iHourPayment) {
        this.iHourPayment = iHourPayment;
    }

    public String getName() {
        return stName;
    }

    public void setName(String stName) {
        this.stName = stName;
    }

    public Integer getHours() {
        return iHours;
    }

    public void setHours(Integer iHours) {
        this.iHours = iHours;
    }

    public Integer getSalary(){
        return iHourPayment * iHours;
    }
}
