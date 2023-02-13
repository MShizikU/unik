package Shapes;

public class Rectangle extends Shape{

    protected double width;
    protected double length;

    public Rectangle(){
        this.color = "Transparent";
        this.filled = false;
        this.width = 0.0;
        this.length = 0.0;
    }

    public Rectangle(double width, double length){
        this.color = "Transparent";
        this.filled = false;
        this.width = width;
        this.length = length;
    }

    public Rectangle(String color, boolean filled, double width, double length){
        this.color = color;
        this.filled = filled;
        this.width = width;
        this.length = length;
    }

    public double getWidth(){
        return width;
    }

    public double getLength(){
        return length;
    }

    public void setWidth(double width){
        this.width = width;
    }

    public void setLength(double length){
        this.length = length;
    }

    @Override
    public double getArea() {
        return length * width;
    }

    @Override
    public double getPerimeter() {
        return (length + width) * 2;
    }

    @Override
    public String toString() {
        return "Shape : Rectangle, Length : " + this.length + ", Width : " + this.width + ", Color: " + this.color;
    }
}
