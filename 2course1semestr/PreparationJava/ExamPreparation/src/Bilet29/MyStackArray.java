package Bilet29;

import java.lang.reflect.Array;

public class  MyStackArray<T> {
    T[] array;
    int realSize = 8;
    int currentSize = 0;

    MyStackArray(){
        array = (T[]) new Object[realSize];

    }


    public int size(){

        return currentSize;
    }

    public boolean isEmpty(){

        return currentSize == 0;
    }

    public T pop(){
        T poped = array[currentSize-1];
        array[currentSize-1] = null;
        currentSize--;
        return poped;
    }

    public T top(){
        return array[currentSize-1];
    }

    public void push(T element){
        if (currentSize >= realSize * 0.75) resize(realSize*2);
        array[currentSize++] = element;
    }

    private void resize(int newSize){
        T[] tmp = (T[]) new Object[newSize];
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
