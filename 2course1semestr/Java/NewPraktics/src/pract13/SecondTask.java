package pract13;



public class SecondTask {


    static class Person{
        String Surname = "";
        String Name = " ";
        String Otchestvo = " ";

        public Person(String surname, String name, String otchestvo) {
            Surname = surname;
            Name = name;
            Otchestvo = otchestvo;
        }

        public Person(String surname, String name) {
            Surname = surname;
            Name = name;
        }

        public Person(String surname){
            Surname = surname;
        }

        public void showInfo(){
            System.out.println(Surname + " " + Name.charAt(0) + " " + Otchestvo.charAt(0));
        }
    }

    public static void main(String[] args) {
        Person person = new Person("Viktorov", "Viktor" , "Viktorovich");
        person.showInfo();

        Person secondPerson = new Person("Viktorov", "Viktor");
        secondPerson.showInfo();

        Person thirdPerson = new Person("Viktorov");
        thirdPerson.showInfo();
    }




}
