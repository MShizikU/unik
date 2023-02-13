package Shapes;

public class Circle extends Shape{

    protected double radius;

    public Circle(){
        this.radius = 0.0;
        this.filled = false;
        this.color = "Transparent";
    }

    public Circle(String color, boolean filled, double radius){
        this.color = color;
        this.radius = radius;
        this.filled = filled;
    }

    public Circle(double radius){
        this.radius = radius;
        this.color = "Transparent";
        this.filled = false;
    }

    public double getRadius(){
        return radius;
    }

    public void setRadius(double Radius){
        this.radius = Radius;
    }

    @Override
    public double getArea() {
        return Math.PI*Math.pow(radius,2);
    }

    @Override
    public double getPerimeter() {
        return 2*Math.PI*radius;
    }

    @Override
    public String toString() {
        return "Shape: Circle, radius: " + this.radius + ", color: " + this.color;
    }
}
