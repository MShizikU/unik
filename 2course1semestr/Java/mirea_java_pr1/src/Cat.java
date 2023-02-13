public class Cat {

    private int iAge;
    private float iHeight;
    private String stName;

    public Cat(String stName, int iAge, float iHeight){
        this.iAge = iAge;
        this.iHeight = iHeight;
        this.stName = stName;
    }

    public Cat(int iAge, float iHeight){
        this.iAge = iAge;
        this.iHeight = iHeight;
        this.stName = "Cat";
    }

    public void setName(String stName){
        this.stName = stName;
    }

    public void setAge(int iAge){
        this.iAge = iAge;
    }

    public void setHeight(float iHeight){
        this.iHeight = iHeight;
    }

    public String getName(){
        return this.stName;
    }

    public int getAge(){
        return this.iAge;
    }

    public float getHeight(){
        return this.iHeight;
    }

    public void showInfo(){
        System.out.println("Name: " + stName + "\nAge: " + iAge + "\nHeight:" + iHeight);
    }
    public void differentMeasures(){
        System.out.println("Cat's height in sm: " + iHeight * 100 + "\nCat's age in human years: " + iAge * 9);
    }

}
