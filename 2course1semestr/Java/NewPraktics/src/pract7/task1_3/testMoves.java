package pract7.task1_3;

public class testMoves {

    public static void main(String[] args){
        MovablePoint p = new MovablePoint(0,0,5,5);
        System.out.println(p);
        p.moveUp();
        p.moveRight();
        System.out.println(p);
        p.moveDown();
        p.moveLeft();
        System.out.println(p);

        MovableCircle c = new MovableCircle(0,0,5,5,5);
        System.out.println(c);
        c.moveUp();
        c.moveRight();
        System.out.println(c);
        c.moveDown();
        c.moveLeft();
        System.out.println(c);

        MovableRectangle rec1 = new MovableRectangle(-5,5,5,-5,5,5,5,5);
        System.out.println(rec1);
        rec1.moveUp();
        rec1.moveRight();
        System.out.println(rec1);
        rec1.moveDown();
        rec1.moveLeft();
        System.out.println(rec1);

        MovableRectangle rec2 = new MovableRectangle(-5,5,5,-5,0,5,5,5);
        System.out.println(rec2);
        rec2.moveUp();
        rec2.moveRight();
        System.out.println(rec2);
        rec2.moveDown();
        rec2.moveLeft();
        System.out.println(rec2);
    }

}
