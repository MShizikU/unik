package pract12.task1;

import java.awt.*;
import java.awt.geom.Rectangle2D;

public class Rectangle extends Shape{
    int iWidth, iHeight;

    public Rectangle(int iRed, int iGreen, int iBlue, int x, int y, int iWidth, int iHeight) {
        super(iRed, iGreen, iBlue, x, y);

        this.iWidth = iWidth;
        this.iHeight = iHeight;

    }

    public void draw(Graphics g) {

        Graphics2D g2d = (Graphics2D) g;
        Rectangle2D.Double rec = new Rectangle2D.Double(center.x, center.y, iWidth, iHeight);

        g2d.setColor(new Color(color.iRed, color.iRed, color.iRed));
        g2d.fill(rec);

    }
}
