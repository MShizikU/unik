package pract6.task6_9;

public class Shop implements Printable{
    private String Author;
    private String Season;
    private String Theme;

    public Shop(String author, String season, String theme) {
        Author = author;
        Season = season;
        Theme = theme;
    }

    @Override
    public void print(){
        System.out.println("\nAuthor: " + Author + "\nSeason: " + Season + "\nTheme: " + Theme);
    }

}