package pract12.task1;

import java.awt.*;
import java.awt.geom.GeneralPath;
import java.util.Random;

public class Thriangle extends Shape{
    Point a, b, c;
    private Random random = new Random();

    public Thriangle(int r, int g, int b, int x, int y){

        super(r, g, b, x, y);

        this.a = new Point(x + random.nextInt(-150, 150), x + random.nextInt(-150, 150));
        this.b = new Point(x + random.nextInt(-150, 150), x + random.nextInt(-150, 150));
        this.c = new Point(x + random.nextInt(-150, 150), x + random.nextInt(-150, 150));

    }

    public void draw(Graphics g) {
        int xPoints[] = {a.x, b.x, c.x};
        int yPoints[] = {a.y, b.y, c.y};


        Graphics2D g2d = (Graphics2D) g;
        GeneralPath triangle = new GeneralPath();

        triangle.moveTo(xPoints[0] + center.x, yPoints[0] + center.y);

        for (int i = 1; i < xPoints.length; i++) {
            triangle.lineTo(xPoints[i] + center.x, yPoints[i] + center.y);
        }
        triangle.closePath();

        g2d.setColor(new Color(color.iRed, color.iGreen, color.iBlue));
        g2d.fill(triangle);
    }
}
