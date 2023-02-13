package pract19.task1;

import java.math.BigInteger;

public class INNException extends Exception{

    public INNException(){
        super("\nДанный INN не действителен!\n");
    }
}
