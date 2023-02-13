package pract19.task2;

public class EmptyStringException extends IllegalArgumentException{
    public EmptyStringException(){
        super("Empty string not allowed");
    }

}
