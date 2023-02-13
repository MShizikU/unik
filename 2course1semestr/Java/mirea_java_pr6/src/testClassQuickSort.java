public class testClassQuickSort {

    Student[] StudentsList;

    public void fillStudentsList(int length){
        StudentsList = new Student[length];

        for(int i = 0; i < length; i ++){
            StudentsList[i] = new Student((double) (Math.random()*1000));
        }
    }

    public void quickSort(int low, int high){
        if (StudentsList.length == 0) {
            return;
        }

        if (low >= high) {
            return;
        }

        Student basePoint = StudentsList[(int)(low + (high - low) / 2)];

        int i = low, j = high;

        while (i <= j) {

            while (StudentsList[i].compareTo(basePoint) < 0) {
                i++;
            }

            while (StudentsList[j].compareTo(basePoint) > 0) {
                j--;
            }

            if (i <= j) {//меняем местами
                Student temp = StudentsList[i];
                StudentsList[i] = StudentsList[j];
                StudentsList[j] = temp;
                i++;
                j--;
            }

        }

        if (low < j) {
            quickSort(low, j);
        }

        if (high > i) {
            quickSort(i, high);
        }
    }

}
