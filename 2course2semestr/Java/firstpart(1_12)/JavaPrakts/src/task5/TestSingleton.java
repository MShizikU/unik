package task5;

public class TestSingleton {
    public static void main(String[] args) {
        Singleton1 s1 =Singleton1.getInstance();
        Singleton1 s1e = Singleton1.getInstance();
        System.out.println(s1+" "+s1e+" "+s1.equals(s1e));

        Singleton2 s2 = Singleton2.getInstance();
        Singleton2 s2e = Singleton2.getInstance();
        System.out.println(s2+" "+s2e+" "+s2.equals(s2e));

        Singleton3 s3 = Singleton3.getInstance();
        Singleton3 s3e = Singleton3.getInstance();
        System.out.println(s3+" "+s3e+" "+s3.equals(s3e));

        Singleton4 s4 = Singleton4.getInstance();
        Singleton4 s4e = Singleton4.getInstance();
        System.out.println(s4+" "+s4e+" "+s4.equals(s4e));

        Singleton5 s5 = Singleton5.getInstance();
        Singleton5 s5e = Singleton5.getInstance();
        System.out.println(s5+" "+s5e+" "+s5.equals(s5e));

    }
}
