package pract20.task1_3;

public class Test {
    public static void main(String[] args) {
        ThreeClasses<Integer, String, AnimalNext> tmp = new ThreeClasses<>(5, "tmp", new AnimalNext(5,"tmp",10));
        tmp.showClassesName();
    }
}
