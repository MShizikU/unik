package pract3.task1.point2;

class Circle {
    Point center;
    int radius;

    public Circle(double x, double y, int radius) {
        center = new Point(x, y);
        this.radius = radius;
    }

    public int getRadius() {
        return this.radius;
    }
}
