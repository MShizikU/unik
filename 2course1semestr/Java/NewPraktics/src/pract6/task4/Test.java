package pract6.task4;

public class Test {

    public static void main(String[] args) {
        System.out.println(new Car(5).getPrice());
        System.out.println(new Dress(10.0).getPrice());
        System.out.println(new Planet().getPrice());
    }

}


class Car implements Priceable{
    private Integer price = 5;

    public Car(Integer price) {
        this.price = price;
    }

    @Override
    public String getPrice(){
        return this.price.toString();
    }
}


class Dress implements Priceable{

    Double price = 5.5;

    public Dress(Double price) {
        this.price = price;
    }

    @Override
    public String getPrice(){
        return this.price.toString();
    }
}

class Planet implements Priceable{}