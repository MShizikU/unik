public class Ball {
    private int iRadius;
    private String stColor;

    public Ball(int iRadius, String stColor){
        this.iRadius = iRadius;
        this.stColor = stColor;
    }

    public Ball(int Radius){
        this.iRadius = iRadius;
        this.stColor = "Transparent";
    }

    public Ball(String stColor){
        this.iRadius = 0;
        this.stColor = stColor;
    }

    public Ball(){
        this.iRadius = 0;
        this.stColor = "Transparent";
    }

    public void setRadius(int iRadius){
        this.iRadius = iRadius;
    }

    public void setColor (String stColor){
        this.stColor = stColor;
    }

    public int getRadius(){
        return this.iRadius;
    }

    public String getColor(){
        return this.stColor;
    }

    public void showInfo(){
        System.out.println("Color: " + stColor + "\nRadius: " + iRadius);
    }

    public void showDeamiter(){
        System.out.println("Diameter: " + iRadius / 2);
    }

}
