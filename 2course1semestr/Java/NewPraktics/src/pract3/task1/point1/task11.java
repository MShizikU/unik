package pract3.task1.point1;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Random;

public class task11 {


    public static void main(String[] args){
        ArrayList <Double> FirstGeneration = new ArrayList<>();
        ArrayList <Double> SecondGeneration = new ArrayList<>();
        Random rand = new Random();
        for(int i = 0; i < 10 ; i ++){
            FirstGeneration.add(Math.random()*1000);
            SecondGeneration.add(rand.nextDouble(1000));
        }
        System.out.println("First " + FirstGeneration.toString());
        System.out.println("Second " + SecondGeneration.toString());
        FirstGeneration.sort(Double::compareTo);
        SecondGeneration.sort(Double::compareTo);
        System.out.println("First " + FirstGeneration.toString());
        System.out.println("Second " + SecondGeneration.toString());
    }

}
