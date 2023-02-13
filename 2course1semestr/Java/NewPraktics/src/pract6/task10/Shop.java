package pract6.task10;

import java.util.ArrayList;
import java.util.Arrays;

public class Shop {
    ArrayList<Computer> shop_goods;

    public Shop(int iCountElements) {
        shop_goods = new ArrayList<>();
        for (int i = 0; i < iCountElements; i++) {

            switch (i % 3) {
                case 0: {
                    shop_goods.add(new Computer(ComputerNames.TOP, new Memory("top", (i + 1) * 1000, (i + 1) * 1024), new Monitor("top", (i + 1)*100, (i + 1)*100), new Processor("top", (i + 1) * 2000, (i + 1) / 10 * 8, (i + 1) / 10 * 16), (i + 1) * 10000));
                    break;
                }
                case 1: {
                    shop_goods.add(new Computer(ComputerNames.MIDDLE, new Memory("MIDDLE", (i + 1) * 1000, (i + 1) * 1024), new Monitor("MIDDLE", (i + 1)*10, (i + 1)*10), new Processor("MIDDLE", (i + 1) * 200, (i + 1) / 10 * 8, (i + 1) / 10 * 16), (i + 1) * 1000));
                    break;
                }
                case 2: {
                    shop_goods.add(new Computer(ComputerNames.LOW, new Memory("LOW", (i + 1) * 1000, (i + 1) * 1024), new Monitor("LOW", (i + 1), (i + 1)), new Processor("LOW", (i + 1) * 20, (i + 1) / 10 * 8, (i + 1) / 10 * 16), (i + 1) * 100));
                }
            }
        }
    }

    public void removeComputer(int iPosition) {
        shop_goods.remove(iPosition);
    }

    public void addComputers(Computer newComputer) {
        shop_goods.add(newComputer);
    }

    public Computer findComputer(String stComplectation) {

        Computer tmp = shop_goods.get(0);
        for (int i = 0; i < shop_goods.size(); i++) {
            if (shop_goods.get(i).stName() == ComputerNames.TOP && stComplectation.equals(ComputerNames.TOP.getStTitle())) {
                if (shop_goods.get(i).Price() > tmp.Price()) {
                    tmp = shop_goods.get(i);
                }
            } else if (shop_goods.get(i).stName() == ComputerNames.MIDDLE && stComplectation.equals(ComputerNames.MIDDLE.getStTitle())) {
                if (shop_goods.get(i).Price() <= tmp.Price()) {
                    tmp = shop_goods.get(i);
                }
            } else if (shop_goods.get(i).stName() == ComputerNames.LOW && stComplectation.equals(ComputerNames.LOW.getStTitle())) {
                if (shop_goods.get(i).Price() < tmp.Price()) {
                    tmp = shop_goods.get(i);
                }
            }
        }
        return tmp;
    }

    @Override
    public String toString(){
        return "Goods: " + shop_goods.toString();
    }

}
