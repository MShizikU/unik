package pract7.task4;

public class MathCalculable implements MathCalculate {

    @Override
    public double pow(double x, double pow) {

        int tmp = 1;
        for (int i = 1; i < pow; i++) tmp *= x;
        return tmp;
    }

    @Override
    public double complexMode(double x, double y) {
        return Math.sqrt(pow(x, 2d) + pow(y, 2d));
    }

    public double calculateCircleLength(Double radius) {
        return MathCalculate.PI * 2 * radius;
    }


}
