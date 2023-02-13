package BiletNoname;

import java.util.Arrays;
import java.util.Stack;

public class noname {
    public static void main(String[] args) {
        Integer[] array = new Integer[]{1,8,7,2,9,18,12,0};
        System.out.println(Arrays.toString(array));
        reverseHalf(array);
        System.out.println(Arrays.toString(array));
    }

    public static void reverseHalf(Integer[] array){
        Stack<Integer> temp = new Stack<>();
        for(int i = 1; i < array.length; i += 2)
            temp.push(array[i]);
        for(int i = 1; i < array.length; i += 2)
            array[i] = temp.pop();
    }
}
