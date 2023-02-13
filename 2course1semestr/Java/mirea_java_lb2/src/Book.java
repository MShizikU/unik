public class Book {
    private String Author;
    private String Name;
    private Integer YearOfPublishing;
    private Integer Pages;

    public Book(String author, String name, Integer yearOfPublishing, Integer pages) {
        Author = author;
        Name = name;
        YearOfPublishing = yearOfPublishing;
        Pages = pages;
    }

    public Book(String author, String name, Integer yearOfPublishing) {
        Author = author;
        Name = name;
        YearOfPublishing = yearOfPublishing;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Integer getYearOfPublishing() {
        return YearOfPublishing;
    }

    public void setYearOfPublishing(Integer yearOfPublishing) {
        YearOfPublishing = yearOfPublishing;
    }

    public Integer getPages() {
        return Pages;
    }

    public void setPages(Integer pages) {
        Pages = pages;
    }

    @Override
    public String toString(){
        return "Книга автора - " + Author + " " + YearOfPublishing + " года издания: " + Name + " " + Pages + "стр. ";
    }
}
