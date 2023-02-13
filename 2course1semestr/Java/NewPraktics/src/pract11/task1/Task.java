package pract11.task1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Task{

    private String stDeveloperName;
    private Date startDate;
    private  Date endDate;

    public Task(String stDeveloperName, Date startDate) {
        this.stDeveloperName = stDeveloperName;
        this.startDate = startDate;
    }

    public String getDeveloperName() {
        return stDeveloperName;
    }

    public void setDeveloperName(String stDeveloperName) {
        this.stDeveloperName = stDeveloperName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }


    @Override
    public String toString(){
        return "Developer: "
                + stDeveloperName
                + " started at: "+ new SimpleDateFormat("E yyyy - MM - dd" ).format(startDate)
                + " ended at: "+ new SimpleDateFormat("E yyyy - MM - dd" ).format(endDate)
                + " time: " + (endDate.getTime() - startDate.getTime())/(1000 * 3600)
                + " hours";
    }
}
