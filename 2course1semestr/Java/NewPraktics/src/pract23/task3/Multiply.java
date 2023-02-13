package pract23.task3;

public class Multiply extends Operation{

    public Multiply(TrippleExpression expLeft, TrippleExpression expRight){
        super(expLeft, expRight);
    }


    public int evaluate(int left, int right) {
        return left * right;
    }

    public double evaluate(double left, double right){
        return left * right;
    }
}
