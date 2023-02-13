public class BookTest {
    public static void main(String[] args) {
        Book b1 = new Book("Пушкин А.С", "Капитанская дочка", 2005, 5);
        b1.setAuthor("Толстой Л.Н.");
        b1.setName("Война и Мир");
        b1.setPages(2000);
        b1.setYearOfPublishing(1700);
        System.out.println(b1.toString());
    }
}
