import java.util.Random;

public class FirstVariant {

    private static int[] array;

    public static void main(String[] args){
        fillArray(10);
        showArray(10);
        System.out.println(getArraySumFor(10));
        System.out.println(getArraySumWhile(10));
        System.out.println(getArraySumDoWhile(10));

    }

    private static void fillArray(int length){
        array = new int[length];
        for (int i = 0; i < length; i ++){
            array[i] = (int)(Math.random()*length);
        }
    }

    private static int getArraySumFor(int length){
        int sum = 0;
        for(int i = 0; i < length; i++){
            sum += array[i];
        }
        return sum;
    }

    private static int getArraySumWhile(int length){
        int sum = 0;
        int i =0;
        while (i < length){
            sum +=array[i++];
        }
        return sum;
    }

    private static int getArraySumDoWhile(int length) {
        int sum = 0;

        if(length == 0) return 0;

        int i = 0;

        do{
            sum += array[i++];
        }while(i < length);
        return sum;
    }



    private static void showArray(int length){
        for (int i =0; i < length; i++){
            System.out.print(array[i] + " ");
        }
        System.out.println("\n");
    }
}
