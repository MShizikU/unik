package pract12.task1;

import java.awt.*;
import java.awt.geom.Ellipse2D;

public class Circle extends Shape {

    int iDiameter;

    public Circle(int iRed, int iGreen, int iBlue, int x, int y, int iDiameter) {
        super(iRed, iGreen, iBlue, x, y);
        this.iDiameter = iDiameter;
    }

    public void draw(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;
        Ellipse2D.Double circle = new Ellipse2D.Double(center.x, center.y, iDiameter, iDiameter);

        g2d.setColor(new Color(color.iRed, color.iGreen, color.iBlue));
        g2d.fill(circle);
    }
    
}
