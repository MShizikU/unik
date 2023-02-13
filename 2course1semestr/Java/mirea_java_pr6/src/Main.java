import java.util.Arrays;

public class Main {

    public static void main(String[] args){
        testClassInsertionSort testClass = new testClassInsertionSort();
        testClass.fillStudentsList(10);
        System.out.println(Arrays.toString(testClass.StudentsList));
        testClass.insertionSortStudentsList();
        System.out.println(Arrays.toString(testClass.StudentsList));

        testClassQuickSort testClassQuickSort = new testClassQuickSort();
        testClassQuickSort.fillStudentsList(10);
        System.out.println(Arrays.toString(testClassQuickSort.StudentsList));
        testClassQuickSort.quickSort(0,9);
        System.out.println(Arrays.toString(testClassQuickSort.StudentsList));

        testClassMergeSort testClassMergeSort = new testClassMergeSort();
        testClassMergeSort.execute(10,10);
    }

}
