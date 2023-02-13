package pract20.task4;

public class MinMax<T extends Comparable>{
    private T[] arMinMax;

    public MinMax(T[] arMinMax) {
        this.arMinMax = arMinMax;
    }

    public T findMin(){
        if (arMinMax.length == 0) return null;
        T min = arMinMax[0];
        for(int i = 1; i < arMinMax.length; i++){
            if(arMinMax[i].compareTo(min) < 0 ){
                min = arMinMax[i];
            }
        }
        return min;
    }

    public T findMax(){
        if (arMinMax.length == 0) return null;
        T max = arMinMax[0];
        for(int i = 1; i < arMinMax.length; i++){
            if(arMinMax[i].compareTo(max) > 0 ){
                max = arMinMax[i];
            }
        }
        return max;
    }
}
