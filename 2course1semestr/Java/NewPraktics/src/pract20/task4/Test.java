package pract20.task4;

import pract20.task1_3.Animal;

public class Test {

    public static void main(String[] args) {
        MinMax<Double> tmp = new MinMax<>(new Double[]{5.0D, 2.0d, 3.5d, 4.0d, 1.0d});
        System.out.println(tmp.findMin());
        System.out.println(tmp.findMax());
    }

}
