package pract23.task3;

public abstract class Operation implements TrippleExpression {

    private TrippleExpression expLeft;
    private TrippleExpression expRight;

    public Operation(TrippleExpression expLeft, TrippleExpression expRight){
        this.expLeft = expLeft;
        this.expRight = expRight;
    }

    public abstract int evaluate(int left, int right);


    public int evaluate(int x, int y, int z) {
        return evaluate(expLeft.evaluate(x,y,z), expRight.evaluate(x,y,z));
    }

}
