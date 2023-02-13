


public class Main {
    public static void main(String[] args){
        Cat c1 = new Cat("Cat", 5,0.5F);
        c1.differentMeasures();
        c1.setAge(45);
        c1.showInfo();

        Ball b1 = new Ball(10, "Red");
        b1.setColor("Black");
        b1.showInfo();
        b1.setRadius(100);
        b1.showDeamiter();

        ComputerMouse cm1 = new ComputerMouse(100);
        cm1.Click();
        cm1.Click();
        cm1.Click();
        cm1.Click();
        cm1.setEnergy(95);
        cm1.showInfo();
    }

}
