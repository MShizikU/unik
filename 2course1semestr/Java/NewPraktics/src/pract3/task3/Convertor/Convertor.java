package pract3.task3.Convertor;


import java.util.Scanner;

class Convertor{
    String[] currencyList = {"RUB", "USD", "EUR", "GPB"};
    Scanner scanner = new Scanner(System.in);
    double[][] convertTable = {
            {1.0, 0.017, 0.017, 0.015},
            {60.2, 1.0, 1.02, 0.9},
            {57.45, 0.98, 1.0, 0.88},
            {67.12, 1.11, 1.14, 1.0},
    };

    public Convertor(){}

    public void Execute(){
        int chooseStartCurrency = -1;

        do{
            System.out.println("0 - End Converter`s work");
            for(int i =0; i < currencyList.length; i++)
                System.out.printf("%d - %s\n", i + 1, currencyList[i]);
            System.out.print("Choose start currency: ");

            do {
                chooseStartCurrency = scanner.nextInt();
                if(chooseStartCurrency < 0 || chooseStartCurrency > 4) System.out.print("Wrong number of currency, repeat enter: ");
            } while(chooseStartCurrency < 0 || chooseStartCurrency > 4);

            if (chooseStartCurrency != 0)
            {
                System.out.print("\nWhich amount of money you want to convert :"  );
                double startAmount = (double) scanner.nextInt();

                convertCurrency(chooseStartCurrency - 1, startAmount);
            }

        }while (chooseStartCurrency != 0);

        System.out.println("-= End of Converter`s work =-");
    }

    public void convertCurrency(int startCurrencyNum, double startAmount){
        int chooseEndCurrency = -1;

        for(int i =0; i < currencyList.length; i++) {
            if (i != startCurrencyNum) System.out.printf("%d - %s\n", i + 1, currencyList[i]);
        }
        System.out.print("Choose end currency: ");

        do {
            chooseEndCurrency = scanner.nextInt();
            if(chooseEndCurrency < 0 || chooseEndCurrency > 4 || chooseEndCurrency == startCurrencyNum)
                System.out.print("Wrong number of currency, repeat enter: ");
        } while(chooseEndCurrency < 0 || chooseEndCurrency > 4 || chooseEndCurrency == startCurrencyNum);


        chooseEndCurrency--;

        double endAmount = startAmount * convertTable[startCurrencyNum][chooseEndCurrency];
        System.out.printf("-= Instead of %.2f %s it will cost %.2f %s\n", startAmount, currencyList[startCurrencyNum], endAmount, currencyList[chooseEndCurrency]);
    }

    public static void main(String[] args) {
        Convertor convertor = new Convertor();
        convertor.Execute();
    }

}