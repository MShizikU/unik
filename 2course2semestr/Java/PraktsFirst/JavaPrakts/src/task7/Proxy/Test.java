package task7.Proxy;

public class Test {
    public static void main(String[] args) {
        Service serv = new Proxy();
        System.out.println(serv.operation("For proxy"));
        System.out.println(serv.operation("data"));
    }
}
