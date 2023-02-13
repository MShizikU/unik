package Bilet27;

import java.lang.reflect.Array;
import java.util.Arrays;

public class MyArrayList {
    Integer[] array;
    int currentSize = 0;
    int realSize = 8;

    MyArrayList(){
        array = new Integer[realSize];
    }

    public void add(Integer element){
        if (currentSize >= realSize * 0.75) resize(realSize*2);
        array[currentSize++] = element;
    }

    public Integer get(Integer index){
        if(index >= currentSize) return null;
        return array[index];
    }

    public Integer size(){
        return currentSize;
    }

    public boolean isEmpty(){
        return currentSize == 0;
    }

    public void remove(Integer index){
        if(index >= currentSize) return;

        for(int i = index; i < currentSize-1; i++){
            Integer tmp = array[i];
            array[i] = array[i+1];
            array[i+1] = tmp;
        }
        array[currentSize-1] = null;
        currentSize--;
    }

    private void resize(int newSize){
        Integer[] tmp = new Integer[newSize];
        realSize = newSize;
        for(int i = 0; i < currentSize; i++) tmp[i] = array[i];
        array = tmp;
    }

    @Override
    public String toString(){
        String result = "";
        for(int i = 0; i < currentSize; i++){
            result += array[i] + " ";
        }
        return result;
    }
}
