package pract3.task1.point4;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class task14 {

    public static void main(String[] args) {
        int n = -1;
        int length = 0;
        Scanner keyboard = new Scanner(System.in);

        Random rand = new Random();

        while (n < 0){
            System.out.println("Enter array's size: ");
            n = keyboard.nextInt();
        }

        int[] tmpArray = new int[n];

        for (int  i = 0; i < n; i++){
            tmpArray[i] = (rand).nextInt(n+1);
            if (tmpArray[i] % 2 == 0) length++;
        }
        System.out.println("Array: " + Arrays.toString(tmpArray));

        if (length == 0) return;

        int[] tmpArraySub = new int[length];
        length = 0;
        for(int i = 0; i < n; i++) if (tmpArray[i] % 2 == 0 && tmpArray[i] != 0) tmpArraySub[length++] = tmpArray[i];

        System.out.println("Second array: " + Arrays.toString(tmpArraySub));
    }


}
