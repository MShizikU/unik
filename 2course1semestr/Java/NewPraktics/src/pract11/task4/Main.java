package pract11.task4;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class Main {


    public static void main(String[] args) {
        Date userDate = new Date();

        Scanner keyboard = new Scanner(System.in);
        userDate.setYear(keyboard.nextInt() - 1900);
        userDate.setMonth(keyboard.nextInt() -1);
        userDate.setDate(keyboard.nextInt());
        userDate.setHours(keyboard.nextInt());
        userDate.setMinutes(keyboard.nextInt());

        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy.MM.dd 'at' HH:mm");
        System.out.println("Date: " + dateFormatter.format(userDate));

        Calendar userCalendar = Calendar.getInstance();


        userCalendar.set(Calendar.YEAR, keyboard.nextInt());
        userCalendar.set(Calendar.MONTH,keyboard.nextInt() -1);
        userCalendar.set(Calendar.DAY_OF_MONTH, keyboard.nextInt());
        userCalendar.set(Calendar.HOUR,keyboard.nextInt());
        userCalendar.set(Calendar.MINUTE,keyboard.nextInt());

        SimpleDateFormat calFormatter = new SimpleDateFormat("yyyy.MM.dd 'at' HH:mm");
        System.out.println("Calendar: " + calFormatter.format(userCalendar.getTime()));

    }
}
