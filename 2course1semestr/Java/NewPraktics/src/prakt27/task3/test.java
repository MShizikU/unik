package prakt27.task3;

public class test {

    public static void main(String[] args){
        hashtab tab = new hashtab();
        tab.hashtabInit();
        tab.hashtabAdd(10.5f,"a");
        tab.hashtabAdd(15.3f,"b");
        tab.hashtabAdd(8.2f,"c");
        tab.hashtabAdd(3.65f,"d");
        tab.hashtabAdd(16.42f,"e");
        tab.hashtabAdd(2.91f,"f");
        tab.hashtabAdd(43.1f,"g");
        tab.hashtabAdd(1.0f,"h");
        tab.hashtabAdd(25.64f,"i");
        tab.hashtabAdd(5.6f,"j");
        System.out.println(tab.hashtabLookUp(10.5f));

    }
}
