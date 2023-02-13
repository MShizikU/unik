package pract3.task2;

public class task20 {

    public static void main(String[] args){
        Double d1 = Double.valueOf(2.0d);
        Double d2 = Double.valueOf(0.5);
        Double d3 = Double.parseDouble("0.5");
        Double d4 = Double.parseDouble("1.2");
        int id1 = d1.intValue();
        short sd1 = d1.shortValue();
        byte bd1 = d1.byteValue();
        long ld1 = d1.longValue();
        float fd1 = d1.floatValue();
        double dd1 = d1.doubleValue();

        System.out.println(Double.toString(d1));
        System.out.println(d2.toString());
        System.out.println(String.valueOf(d3));

    }

}
