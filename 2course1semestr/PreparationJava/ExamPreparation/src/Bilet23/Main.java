package Bilet23;

public class Main {
    public static void main(String[] args) {
        FigureFactory factory = new FigureFactory();
        factory.createFigure(FigureType.SQUARE).useFigure();
        factory.createFigure(FigureType.SIRCLE).useFigure();
    }
}
