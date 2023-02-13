package pract7.task7_8;

public class Book implements Printable {

    private String Author;
    private String Date;
    private String Summary;

    public Book(String author, String date, String summary) {
        Author = author;
        Date = date;
        Summary = summary;
    }

    @Override
    public void print(){
        System.out.println("\nAuthor: " + Author + "\nDate: " + Date + "\nSummary: " + Summary);
    }

    public static void printMagazines(Printable[] printables){
        for (Printable printable : printables)
            if (printable instanceof Book)
                printable.print();
    }

}

