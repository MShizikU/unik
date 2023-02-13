package pract6.task10;

public class Main {
    public static void main(String[] args) {
        Shop newShop = new Shop(5);
        newShop.addComputers(new Computer(ComputerNames.TOP,new Memory("very good",500000, 4096), new Monitor("the best",720,720), new Processor("the worst",5000,6,12),200000));
        System.out.println(newShop);
        newShop.removeComputer(5);
        System.out.println(newShop);
        System.out.println(newShop.findComputer(ComputerNames.TOP.getStTitle()));
    }
}
