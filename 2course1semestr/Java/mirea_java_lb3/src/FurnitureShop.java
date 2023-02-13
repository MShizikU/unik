public class FurnitureShop {

    public static void main(String[] args) {
        Table t1 = new Table("Red",1000,10,20,30,"Wood");
        Chair c1 = new Chair("Blue", 1000, 10,20,30,true);
        Closet cl1 = new Closet("Grey", 1200,10,20,30,5);
        System.out.println(t1);
        System.out.println(c1);
        System.out.println(cl1);

        t1.setColor("Grey");
        t1.setPrice(1234234);
        t1.setMaterial("Metal");

        c1.setMovable(false);
        c1.setColor("Red");
        c1.setSize(30,20,10);

        cl1.setCountDoors(45);
        cl1.setPrice(1236);
        cl1.setSize(40,20,50);

        System.out.println(t1);
        System.out.println(c1);
        System.out.println(cl1);
    }
}
