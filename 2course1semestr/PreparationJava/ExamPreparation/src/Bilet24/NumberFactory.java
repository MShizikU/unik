package Bilet24;

public class NumberFactory {
    public Number createNumber(NumberType type){
        Number number = null;

        switch (type){
            case COMPLEX:
                number = new ComplexNumber();
                break;
            case RATIONAL:
                number = new RationalNumber();
                break;
        }
        return number;
    }
}
