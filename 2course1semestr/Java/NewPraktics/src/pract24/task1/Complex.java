package pract24.task1;

public class Complex {
    private int iReal;
    private int iImage;

    public Complex(int iReal, int iImage){
        this.iReal = iReal;
        this.iImage = iImage;
    }

    public String toString(){
        return iReal + " + " + iImage + "*i";
    }
}
