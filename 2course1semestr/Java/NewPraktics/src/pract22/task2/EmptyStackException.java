package pract22.task2;

public class EmptyStackException extends Exception{
    public EmptyStackException(){
        super("Stack is empty! Retry with another expression");
    }
}
