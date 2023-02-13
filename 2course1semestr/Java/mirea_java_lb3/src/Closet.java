public class Closet extends Furniture{

    int countDoors;

    public Closet(String color, int price, int length, int width, int height, int countDoors) {

        this.Color = color;
        this.Price = price;
        this.length = length;
        this.width = width;
        this.height = height;

        this.countDoors = countDoors;
    }

    @Override
    public void setSize(int x, int y, int z) {
        this.length = x;
        this.width = y;
        this.height = z;
    }

    @Override
    public void setPrice(int price) {
        this.Price = price;
    }

    @Override
    public void setColor(String color) {
        this.Color = color;
    }

    @Override
    public String getSize() {
        return length + "X" + width + "X" + height;
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
        return length*height*width - length*height*width/100;
    }

    @Override
    public int showPriceForX(int count) {
        return count*Price - count*2;
    }

    public int getCountDoors() {
        return countDoors;
    }

    public void setCountDoors(int countDoors) {
        this.countDoors = countDoors;
    }

    @Override
    public String toString() {
        return "Шкаф " + length + "X" + width + "X" + height + " ,цвет - " + Color +" ,кол-во дверей - " + countDoors + ", за " + Price + " руб.";
    }
}
