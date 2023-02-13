package pract13;

import java.util.Scanner;

public class FirstTask {

    public static void main(String[] args) {

        Scanner keyboard = new Scanner(System.in);
        System.out.println("\nEnter any string: ");
        String stUserInput = keyboard.nextLine();
        ex1(stUserInput);
        System.out.println(ex2(stUserInput));
        System.out.println(ex3(stUserInput));
        System.out.println(ex4(stUserInput));
        System.out.println(ex5(stUserInput));
        System.out.println(ex6(stUserInput));
        System.out.println(ex7(stUserInput));
        System.out.println(ex8(stUserInput));
        System.out.println(ex9(stUserInput));
        System.out.println(ex10(stUserInput));

    }

    public static void ex1(String str){
        System.out.println(str);
    }

    public static Character ex2(String str){
        return str.charAt(str.length()-1);
    }

    public static boolean ex3(String str){
        return str.endsWith("!!!");
    }

    public static boolean ex4(String str){
        return str.startsWith("I like");
    }

    public static boolean ex5(String str){
        return str.contains("Java");
    }

    public static int ex6(String str){
        return str.indexOf("Java");
    }

    public static String ex7(String str){
        return str.replace('a', 'o');
    }

    public static String ex8(String str){
        return str.toUpperCase();
    }

    public static String ex9(String str){
        return str.toLowerCase();
    }

    public static String ex10(String str){
        return str.substring(str.indexOf("Java"), str.indexOf("Java") + 4);
    }

}
