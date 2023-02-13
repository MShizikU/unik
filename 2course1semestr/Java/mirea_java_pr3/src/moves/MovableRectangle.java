package moves;

public class MovableRectangle implements Movable{

    private MovablePoint topLeft;
    private MovablePoint bottomRight;

    public MovableRectangle(int x1, int x2, int y1, int y2, int xSpeed1, int xSpeed2, int ySpeed1, int ySpeed2){
        topLeft = new MovablePoint(x1,y1,xSpeed1,ySpeed1);
        bottomRight = new MovablePoint(x2,y2,xSpeed2, ySpeed2);
    }

    @Override
    public String toString(){
        return "Rectangle: top left point - " + topLeft.toString() + "bottom right point - " + bottomRight.toString();
    }


    @Override
    public void moveUp() {
        if (topLeft.compareSpeeds(bottomRight)){
            topLeft.moveUp();
            bottomRight.moveUp();
        }
    }

    @Override
    public void moveDown() {
        if (topLeft.compareSpeeds(bottomRight)){
            topLeft.moveDown();
            bottomRight.moveDown();
        }
    }

    @Override
    public void moveLeft() {
        if (topLeft.compareSpeeds(bottomRight)){
            topLeft.moveLeft();
            bottomRight.moveLeft();
        }
    }

    @Override
    public void moveRight() {
        if (topLeft.compareSpeeds(bottomRight)){
            topLeft.moveRight();
            bottomRight.moveRight();
        }
    }

}
