package Shapes;

public class Square extends Rectangle{

    public Square(){
        this.color = "Transparent";
        this.filled = false;
        this.width = 0.0;
        this.length = 0.0;
    }

    public Square(double side){
        this.color = "Transparent";
        this.filled = false;
        this.width = side;
        this.length = side;
    }

    public Square(String color, boolean filled, double side){
        this.color = color;
        this.filled = filled;
        this.width = side;
        this.length = side;
    }

    public double getSide(){
        return width;
    }

    public void setSide(double side){
        this.width = side;
        this.length = side;
    }

    @Override
    public void setWidth(double side){
        this.width = side;
        this.length = side;
    }

    @Override
    public void setLength(double side){
        this.width = side;
        this.length = side;
    }

    @Override
    public String toString(){
        return "Shape : Square, Side: " + this.width + ", Color: " + this.color;
    }
}
