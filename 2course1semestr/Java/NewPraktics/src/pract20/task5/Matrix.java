package pract20.task5;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class Matrix<E> {
    ArrayList<ArrayList<E>> matrix = new ArrayList<>();

    int sizeX = 0;
    int sizeY = 0;

    public void setMatrix(E[][] matrix){
        for (E[] e : matrix){
            sizeY +=1;
            int sizeXTmp = 0;
            ArrayList<E> tmp = new ArrayList<>();
            for(E element : e){
                sizeXTmp++;
                tmp.add(element);
            }
            if(sizeXTmp != sizeX) sizeX = sizeXTmp;
            this.matrix.add(tmp);
        }
    }

    public void addColumn(E[] column){
        sizeX+=1;
        for(int i = 0; i < column.length; i++){
            if (matrix.size() >=i){
                matrix.get(i).add(column[i]);
            }
        }
    }

    public void addRow(E[] row){
        sizeY+=1;
        ArrayList<E> tmp = new ArrayList<>();
        for(int i = 0; i < row.length; i++){
            tmp.add(row[i]);
        }
        matrix.add(tmp);
    }

    public boolean transparentMatrix(){
        if (sizeX != sizeY) return false;
        for(int i = 0; i < sizeY; i++){
            for(int j = i; j < sizeX; j++) {
                E tmp = matrix.get(j).get(i);

                matrix.get(j).set(i, matrix.get(i).get(j));
                matrix.get(i).set(j,tmp);
            }
        }
        return true;
    }

    public E findMax(Comparator<? super E> comparator){
        if (sizeY == 0 && sizeX == 0) return null;
        E max = matrix.get(0).get(0);
        for(int i = 0; i < sizeY; i++){
            for(int j = 0; j < sizeX; j++){
                if (comparator.compare(max,matrix.get(i).get(i)) < 0){
                    max = matrix.get(i).get(j);
                }
            }
        }
        return max;
    }

    public E findMin(Comparator<? super E> comparator){
        if (sizeY == 0 && sizeX == 0) return null;
        E min = matrix.get(0).get(0);
        for(int i = 0; i < sizeY; i++){
            for(int j = 0; j < sizeX; j++){
                if (comparator.compare(min,matrix.get(i).get(i)) > 0){
                    min = matrix.get(i).get(j);
                }
            }
        }
        return min;
    }

    public void deleteColumn(int index){
        if (index > sizeX) return;
        sizeX-=1;
        for(int i = 0; i < sizeY; i++){
            this.matrix.get(i).remove(index);
        }
    }

    public void deleteRow(int index){
        if(index > sizeY) return;
        sizeY-=1;
        this.matrix.remove(index);
    }

    @Override
    public String toString(){
        String result = "" ;
        for(int i = 0; i < sizeY; i++){
            for(int j = 0; j < sizeX; j++){
                result += matrix.get(i).get(j) + " ";
            }
            result += "\n";
        }
        return result;
    }
}
