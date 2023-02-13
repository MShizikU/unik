package pract7.task7_8;

public class Shop implements Printable {
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

    public static void printMagazines(Printable[] printables){
        for (Printable printable : printables)
            if (printable instanceof Shop)
                printable.print();
    }

}