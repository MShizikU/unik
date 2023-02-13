package pract13;

import java.util.StringTokenizer;

public class ThirdTask {

    static class Address {
        String stCountry = "";
        String stRegion = "";
        String stCity = "";
        String stStreet = "";
        String stHouse = "";
        String stCorpus = "";
        String stApartment = "";

        Address(String str, int iMethod) {
            int counter = 0;
            switch (iMethod) {
                case 0: {
                    String[] arAddresses = str.split(", ");
                    for (int i = 0; i < arAddresses.length; i++) {
                        switch (i) {
                            case 0:
                                stCountry = arAddresses[i];
                            case 1:
                                stRegion = arAddresses[i];
                            case 2:
                                stCity = arAddresses[i];
                            case 3:
                                stStreet = arAddresses[i];
                            case 4:
                                stHouse = arAddresses[i];
                            case 5:
                                stCorpus = arAddresses[i];
                            case 6:
                                stApartment = arAddresses[i];
                        }
                    }
                    break;
                }
                case 1: {
                    StringTokenizer tokenizer = new StringTokenizer(str, ",.;");
                    while (tokenizer.hasMoreTokens()) {
                        switch (counter++) {
                            case 0:
                                stCountry = tokenizer.nextToken();
                            case 1:
                                stRegion = tokenizer.nextToken();
                            case 2:
                                stCity = tokenizer.nextToken();
                            case 3:
                                stStreet = tokenizer.nextToken();
                            case 4:
                                stHouse = tokenizer.nextToken();
                            case 5:
                                stCorpus = tokenizer.nextToken();
                            case 6:
                                stApartment = tokenizer.nextToken();
                        }
                    }
                }
            }
            stCountry = stCountry.replace(" ", "");
            stRegion = stRegion.replace(" ", "");
            stCity = stCity.replace(" ", "");
            stStreet = stStreet.replace(" ", "");
            stHouse = stHouse.replace(" ", "");
            stCorpus = stCorpus.replace(" ", "");
            stApartment = stApartment.replace(" ", "");

        }

        @Override
        public String toString() {
            return "Country: " + stCountry + " " +
                    "Region: " + stRegion + " " +
                    "City: " + stCity + " " +
                    "Street: " + stStreet + " " +
                    "House: " + stHouse + " " +
                    "Corpus: " + stCorpus + " " +
                    "Apartment: " + stApartment;
        }

    }


    public static void main(String[] args) {
        Address first = new Address("Russia, MOSCOW, Moscow, Mira, 26, 122, 313", 0);
        Address second = new Address("Russia, MOSCOW, Moscow, Mira, 26, 122, 313", 1);
        Address third = new Address("Russia; MOSCOW; Moscow; Mira; 26; 122; 313", 1);
        Address fourth = new Address("Russia. MOSCOW. Moscow. Mira. 26. 122. 313", 1);
        System.out.println(first);
        System.out.println(second);
        System.out.println(third);
        System.out.println(fourth);
    }
}
