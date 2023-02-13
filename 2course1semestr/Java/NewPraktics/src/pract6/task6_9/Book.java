package pract6.task6_9;

public class Book implements Printable{

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

}

