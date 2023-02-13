package pract3.task1.point3;

import com.sun.jdi.connect.Connector;

import java.util.ArrayList;
import java.util.Random;

public class task13 {

    public static void main(String[] args){
        ArrayList<Integer> RandomGeneration = new ArrayList<>();
        for(int i = 0; i < 4; i++){
            RandomGeneration.add(new Random().nextInt(10,100));
        }
        System.out.println("Array: " + RandomGeneration.toString());
        System.out.println(checkArray(RandomGeneration));
    }

    public static boolean checkArray(ArrayList<Integer> tmp){
        for(int i = 1; i < tmp.size(); i++){
            if (tmp.get(i) <= tmp.get(i-1)) return false;
        }
        return true;
    }
}
