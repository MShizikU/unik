package pract6.task3;

public class Planet implements Nameable{

    String name;

    public Planet(String name) {
        this.name = name;
    }

    @Override
    public String getName(){
        return name;
    }

}
