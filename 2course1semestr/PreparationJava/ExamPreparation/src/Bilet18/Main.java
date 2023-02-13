package Bilet18;

public class Main {
    public static void main(String[] args) {
        ArrayIntList array = new ArrayIntList(new int[]{1,3,5,2,9,7,-3,0,42,308,17});
        System.out.println(array.longestSortedSequence());
    }
}
