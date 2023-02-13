package prakt27;

public class taskSecond {


    public static void main(String[] args) {
        workWithMap work = new workWithMap();

        work.addValues("1","1");
        work.addValues("2","2");
        work.addValues("2","3");
        work.addValues("1","4");
        work.addValues("1","5");
        work.addValues("3","1");
        work.addValues("3","2");
        work.addValues("4","3");
        work.addValues("4","4");
        work.addValues("5","5");

        System.out.println(work.getSameFirstNameCount());
        System.out.println(work.getSameLastNameCount());

    }
}
