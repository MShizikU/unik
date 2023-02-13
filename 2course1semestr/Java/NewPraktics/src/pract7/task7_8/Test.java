package pract7.task7_8;

public class Test {

    public static void main(String[] args) {
        Book book1 = new Book("Pushkin", "1824", "Good book" );
        Book book2 = new Book("Pushkin", "1815", "weak book");
        Shop shop1 = new Shop("Modeler", "autumn", "mode" );
        Shop shop2 = new Shop("Modeler", "winter", "mode" );

        Printable[] printables = {book1,book2,shop1,shop2};

        for(Printable printable : printables){
            printable.print();
        }
        System.out.println("\nOnly shops:");
        Shop.printMagazines(printables);
        System.out.println("\nOnly books:");
        Book.printMagazines(printables);

    }

}
