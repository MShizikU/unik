package pract3.task1.point2;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Random;

class Tester{
    Circle[] arrCircle;
    int elemNum;


    public Tester(int elemNum){
        Random random = new Random();
        this.elemNum = elemNum;
        arrCircle = new Circle[elemNum];

        for(int i = 0; i < this.elemNum; i++)
            arrCircle[i] = new Circle(random.nextInt(25), random.nextInt(25),
                    random.nextInt(100));
    }

    public Circle minCircle(){
        Circle minCircle = arrCircle[0];

        for (Circle circle : arrCircle) {
            if (circle.getRadius() < minCircle.getRadius())
                minCircle = circle;
        }
        return minCircle;
    }

    public Circle maxCircle(){
        Circle maxCircle = arrCircle[0];

        for (Circle circle : arrCircle) {
            if (circle.getRadius() > maxCircle.getRadius())
                maxCircle = circle;
        }

        return maxCircle;
    }

    public void sortCircles(){
        Arrays.sort(arrCircle, Comparator.comparingInt(Circle::getRadius));
    }

    public String toString(){
        String returnString = "";

        for(Circle circle : arrCircle){
            returnString += circle.getRadius() + ", ";
        }

        returnString = returnString.substring(0, returnString.length() - 2);

        return returnString;
    }
}