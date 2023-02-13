import java.util.*;
import java.util.function.Predicate;

public class CustomArrayList<E>{
    private E[] list;
    private int size;
    private int count;

    public CustomArrayList() {
        this(8);
    }

    public CustomArrayList(int size){
        this.size = size;
        list = (E[]) new Object[size];
        count = 0;
    }

    public CustomArrayList(CustomArrayList<E> secondList){
        this.count = secondList.count;
        this.size = secondList.size;
        System.arraycopy(secondList,0,list,0, secondList.count);
    }

    public void add(E obj){
        if(size - count == 1) resize(size*2);
        list[count++] = obj;
    }

    public void add(int index , E obj){
        resize(size+1);
        E prev = list[index];
        E saveNext = list[index];
        for(int i = index+1; i < count; i++){
            saveNext = list[i];
            list[i] = prev;
            prev = saveNext;
        }
        list[count++] = obj;
    }

    public E get(int index){
        return list[index];
    }

    public int indexOf(E obj){
        for(int i = 0; i < count; i++){
            if(list[i].equals(obj)){
                return i;
            }
        }
        return -1;
    }

    public int lastIndexOf(E obj){
        int tmp = -1;
        for(int i = 0; i < count; i++){
            if(list[i].equals(obj)){
                tmp = i;
            }
        }
        return tmp;
    }

    public E remove(int index){
        E returnedObj = list[index];
        E prev = list[count-1];
        E nextSaver;
        list[count-1] = null;
        for(int i = count-1; i >=index; i--){
            nextSaver = list[i-1];
            list[i-1] = prev;
            prev = nextSaver;
        }
        resize(size-1);
        return returnedObj;
    }

    public E set(int index, E obj){
        E tmp = list[index];
        list[index] = obj;
        return tmp;
    }

    public void sort(Comparator<? super E> comp){
        for (int i = count - 1; i >= 1; i--){
            for (int j = 0; j < i; j++) {
                if(comp.compare(list[j], list[j+1])>0){
                    E tmp = list[j];
                    list[j] = list[j+1];
                    list[j+1] = tmp;
                }
            }
        }
    }

    public CustomArrayList<E> sublist(int start, int end){
        CustomArrayList<E> tmp = new CustomArrayList<>();
        if(start > count || end > count){
            return null;
        }

        for(int i = start; i < end; i++){
            tmp.add(list[i]);
        }
        return tmp;
    }



    private void resize(int newSize){
        if(newSize > size){
            list = Arrays.copyOf(list, newSize);
        }
        else{
            E[] tmp = (E[]) new Object[newSize];
            System.arraycopy(list, 0 , tmp, 0 , newSize);
            list = tmp;
        }
        size = newSize;
    }

    @Override
    public String toString(){
        return "ArrayList{" +
                "list = " + Arrays.toString(list) +
                ", elements = " + count +
                ", size = " + size +
                "}";
    }
}
