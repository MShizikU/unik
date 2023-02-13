public class Chair extends Furniture {

    boolean isMovable;

    public Chair(String color, int price, int length, int width, int height, boolean isMovable) {
        this.Color = color;
        this.Price = price;
        this.length = length;
        this.width = width;
        this.height = height;

        this.isMovable = isMovable;
    }

    @Override
    public void setSize(int x, int y, int z) {
        length = x;
        width = y;
        height =z;
    }

    @Override
    public void setPrice(int price) {
        Price = price;
    }

    @Override
    public void setColor(String color) {
        Color = color;
    }

    @Override
    public String getSize() {
        return length + "X"  + width + "X" + height;
    }

    @Override
    public int getPrice() {
        return Price;
    }

    @Override
    public String getColor() {
        return Color;
    }

    @Override
    public int getUsefulArea() {
        return length*width*height;
    }

    @Override
    public int showPriceForX(int count) {
        return count*Price - count*10;
    }

    public boolean isMovable() {
        return isMovable;
    }

    public void setMovable(boolean movable) {
        isMovable = movable;
    }

    @Override
    public String toString(){
        return "Стул " + length + "X" + width + "X" + height + " ,цвет - " + Color +" ,двигается - " + isMovable + ", за " + Price + " руб.";
    }
}
