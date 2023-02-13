package pract23.task2;

public class ArrayQueue extends AbstractQueue{
    private Object[] array;
    private int realSize = 8;
    private int currentSize = 0;

    public ArrayQueue(){
        array = new Object[realSize];
    }

    private void increaseRealSize(int newSize){
        if ( newSize < array.length) return;
        realSize = newSize;
        Object[] tmp = new Object[realSize];

        System.arraycopy(array, 0, tmp, 0, array.length);

        array = tmp;
    }

    protected void enquequeExecute(Object element){
        if (currentSize + 1 > realSize * 0.75) increaseRealSize(realSize*2);
        array[currentSize++] = element;
    }

    protected Object dequeueExecute(){
        Object[] tmp = new Object[realSize];
        Object firstElement = array[0];
        System.arraycopy(array, 0, tmp, 0, currentSize--);
        array = tmp;
        return firstElement;
    }

    protected Object elementExecute(){
        return array[0];
    }

    protected String showExecute(){
        String tmp = "ArrayQueue: ";
        for(Object element : array) tmp += element.toString() + " ";
        return tmp;
    }
}
