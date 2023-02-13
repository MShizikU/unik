package prakt26;

public class test {

    public static void main(String[] args){
        hashtab tab = new hashtab();
        tab.hashtabInit();
        tab.hashtabAdd(10,"a");
        tab.hashtabAdd(15,"b");
        tab.hashtabAdd(8,"c");
        tab.hashtabAdd(3,"d");
        tab.hashtabAdd(16,"e");
        tab.hashtabAdd(2,"f");
        tab.hashtabAdd(4,"g");
        tab.hashtabAdd(1,"h");
        tab.hashtabAdd(25,"i");
        tab.hashtabAdd(5,"j");
        System.out.println(tab.hashtabLookUp(10));

    }

}
