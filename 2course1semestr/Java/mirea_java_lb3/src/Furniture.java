public abstract class Furniture {

    protected String Color;

    protected int Price;

    protected int length;
    protected int width;
    protected int height;

    public abstract void setSize(int x, int y, int z);
    public abstract void setPrice(int price);
    public abstract void setColor(String color);

    public abstract String getSize();
    public abstract int getPrice();
    public abstract String getColor();


    public abstract int getUsefulArea();
    public abstract int showPriceForX(int count);
}
