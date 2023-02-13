package Bilet18;

public class ArrayIntList {
    private int[] elementData;
    private int size;

    ArrayIntList(int[] array){
        size = array.length;
        elementData = new int[size];
        for(int i = 0; i < size; i++) elementData[i] = array[i];
    }

    public int longestSortedSequence(){
        if (size == 0) return 0;
        int max_length = 1;
        int cur_length = 1;
        int prev_number = elementData[0];

        for(int i = 0; i < size; i++){
            prev_number = elementData[i];
            for(int j = i + 1; j < size; j++){
                if (prev_number < elementData[j]){
                    cur_length++;
                }
                else{
                    break;
                }
                prev_number = elementData[j];
            }
            if (cur_length > max_length) max_length = cur_length;
            cur_length = 1;
        }

        return max_length;
    }
}
