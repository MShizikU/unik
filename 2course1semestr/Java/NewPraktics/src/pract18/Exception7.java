package pract18;

import java.util.Scanner;

public class Exception7 {

    public static void getKey() {
        Scanner myScanner = new Scanner( System.in);
        try {

            String key = myScanner.next();
            printDetails(key);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void printDetails(String key) throws Exception {
        try { String message = getDetails(key);
            System.out.println( message );
        }catch ( Exception e){
            throw e;
        }
    }
    private static String getDetails(String key) throws Exception {
        if(key.equals("a")) {
            throw new Exception( "Key set to empty string" );
        }
        return "data for " + key; }

    public static void main(String[] args) {
        getKey();
    }
}

