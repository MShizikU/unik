package task5;

public class Singleton1 {
    private static Singleton1 instance=null;

    private Singleton1() {
    }

    public static synchronized Singleton1 getInstance() {
        if(instance == null) {//instance — это сущность созданная на основе класса
            instance = new Singleton1();
            return instance;
        }
        return instance;
    }

}
