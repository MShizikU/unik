package prakt25;


import java.util.regex.Pattern;

public class IPchecker {

    public static void main( String[] args){
        System.out.println((checkIP("127.0.0.1")? "Correct" : "Incorrect"));
        System.out.println((checkIP("255.255.255.0")? "Correct" : "Incorrect"));
        System.out.println((checkIP("1300.6.7.8")? "Correct" : "Incorrect"));
        System.out.println((checkIP("abc.def.gha.bcd")? "Correct" : "Incorrect"));
    }

    public static Boolean checkIP(String stIP){
        var regex = "^(((1?[0-9]?[0-9])|(2[0-4][0-9])|(25[0-5]))\\.){3}(((1?[0-9]?[0-9])|(2[0-4][0-9])|(25[0-5])))$";
       return (Pattern.matches(regex, stIP));
    }
}
