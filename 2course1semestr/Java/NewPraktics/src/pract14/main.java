package pract14;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class main {

    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        String stForSplit = keyboard.nextLine();
        firstTask(stForSplit);
        System.out.println(secondTask("abcdefghijklmnopqrstuv18340"));
        System.out.println(thirdTask("104.000 EU"));
        System.out.println(fourthTask("(1 - 8) – 9 / 4"));
        System.out.println(fifthTask("29/02/1900"));
        System.out.println(sixthTask("@my.ru"));
        eighthTask(new String[]{"first", "second", "empty"});
        ninethTask("qwerrtyuiopasdfghjklzxcvbnmm");
    }


    public static void firstTask(String stForSplit){
        String[] splitString = stForSplit.split("\\s+");
        for(String word : splitString) System.out.println(word);
    }

    public static boolean secondTask(String stTaskTwo){
        return stTaskTwo.matches("abcdefghijklmnopqrstuv18340");
    }

    public static boolean thirdTask(String stTaskThree){
        return stTaskThree.matches("^[0-9]{1,}.[0-9]{1,2}\\s(USD|RUB|EU)");
    }


    public static boolean fourthTask(String stTaskFour){
        return stTaskFour.matches(".*(\\+)\\s*[0-9]{1,}.*");
    }

    public static boolean fifthTask(String stTaskFive){
        return stTaskFive.matches("(0[1-9]|[12][0-9]|3[01])[/](0[13578]|1[02])[/](([0-9]{2})[0-9]{2})|0[1-9]|[12][0-9]|30[/](0[469]|11)[/](([0-9]{2})[0-9]{2})|(0[1-9]|1[0-9]|2[0-8])[/](02)[/](([0-9]{2})[0-9]{2})|29[/](02)[/]((([0-9]{2})(04|08|[2468][048]|[13579][26]))|2000|1000)");
    }

    public static boolean sixthTask(String stTaskSix){
        return stTaskSix.matches("^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)(()|(\\.([a-zA-Z]{2,5})))$");
    }

    public static boolean seventhTask(String stTaskSeven){
        return stTaskSeven.matches("^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\\\\d).*\\$");
    }

    public static void eighthTask(String[] array){
        String[] newArray = (String[])filter(array, new Filter(){
            @Override
            public boolean apply(Object o ){
                return !o.equals("empty");
            }
        });

        System.out.println(Arrays.toString(newArray));
    }

    public static Object[] filter(Object[] array, Filter filter) {
        int iDeletedCount = 0;
        for(int i = 0; i< array.length; i++){
            if(!filter.apply(array[i])){
                iDeletedCount++;
            } else{
                array[i - iDeletedCount] = array[i];
            }
        }
        return Arrays.copyOf(array, array.length - iDeletedCount);
    }

    interface Filter {
        boolean apply(Object o);
    }

    public static void ninethTask(String stTaskNine){
        Map<String, Integer> dictionary = new HashMap<>();
        for(int i = 97; i < 123; i++){
            Pattern pattern = Pattern.compile(Character.toString((char)i));
            Matcher matcher = pattern.matcher(stTaskNine);
            int count = 0;
            while(matcher.find()) count++;
            dictionary.put(Character.toString((char)i), count);
        }

        System.out.println("Map: " + dictionary);
    }


}
