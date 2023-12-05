package mirea.ru.carsharing.exceptions;

public class CustomBadRequestException extends Exception{
    public CustomBadRequestException(String message){
        super(message);
    }
}
