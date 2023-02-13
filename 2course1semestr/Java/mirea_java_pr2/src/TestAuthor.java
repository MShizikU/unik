public class TestAuthor {
    public static void main(String[] args){
        Author a1 = new Author("Alexandr Pushkin","apush@gmail.com",'m');
        System.out.println(a1);
        a1.setEmail("aspushkin@mail.ru");
        System.out.println(a1);
    }
}
