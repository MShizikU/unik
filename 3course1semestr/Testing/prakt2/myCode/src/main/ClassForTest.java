package main;

public class ClassForTest {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }

    public static int NOD(int a, int b) {
        while (a != b) {
            if (a > b) {
                a = a - b;
            } else {
                b = b - a;
            }
        }
        return a;
    }

    public static int NOK(int a, int b) {
        if (a == 0 || b == 0) {
            return 0;
        }
        a = Math.abs(a);
        b = Math.abs(b);
        int result = 0;
        if(a > b){
            result = a;
            while (result % b != 0) {
                result += a;
            }
        }else{
            result = b;
            while (result % a != 0){
                result += b;
            }
        }
        return result;
    }
}