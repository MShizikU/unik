package pract11.task1;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

    public static void main(String[] args) throws ParseException {
        Task first = new Task("Sidorov", (new SimpleDateFormat("dd.MM.yyyy")).parse("28.12.2016"));
        first.setEndDate(new Date());
        System.out.println(first);
    }
}
