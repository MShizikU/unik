package Bilet23;

public class FigureFactory {
    public Figure createFigure(FigureType type){
        Figure figure = null;

        switch (type){
            case SQUARE:
                figure = new Square();
                break;
            case SIRCLE:
                figure = new Sircle();
                break;
        }
        return figure;
    }
}
