package Bilet21;
public class Finder<T> {
    public int find(Comparable<T>[] col, T num) {
        for (int i = 0; i < col.length; ++i){
            if (col[i].compareTo(num) == 0) {
                return i;
            }
        }
        return -1;
    }
}