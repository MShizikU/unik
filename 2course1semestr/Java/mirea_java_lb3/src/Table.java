public class Table extends Furniture
{
    String Material;

    public Table(String color, int price, int length, int width, int height, String Material) {

        this.Color = color;
        this.Price = price;
        this.length = length;
        this.width = width;
        this.height = height;

        this.Material = Material;

    }

    public String getMaterial() {
        return Material;
    }

    public void setMaterial(String material) {
        Material = material;
    }

    @Override
    public void setSize(int x, int y, int z) {
        length = x;
        width = y;
        height = z;
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
        return length*width;
    }

    @Override
    public int showPriceForX(int count) {
        return count*Price;
    }

    @Override
    public String toString(){
        return "Стол " + length + "X" + width + "X" + height + " ,цвет - " + Color +" ,материал - " + Material + ", за " + Price + " руб.";
    }
}
