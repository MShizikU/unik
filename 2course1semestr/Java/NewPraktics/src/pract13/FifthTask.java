package pract13;

public class FifthTask {
    static class Telephone{
        String stCountryCode = "";
        String stFirstThree = "";
        String stSecondThree = "";
        String stFour = "";

        Telephone(String str){
            if (str.charAt(0) == '+'){
                stCountryCode += "+";
                str = str.replace("+", "");
            }
            int iCurrentPos = 0;
            stCountryCode += str.substring(0, str.length() - 10);
            iCurrentPos = stCountryCode.length() - 1;
            stFirstThree += str.substring(iCurrentPos,iCurrentPos + 3);
            iCurrentPos += stFirstThree.length() ;
            stSecondThree += str.substring(iCurrentPos,iCurrentPos + 3);
            iCurrentPos += stSecondThree.length() ;
            stFour += str.substring(iCurrentPos,iCurrentPos + 4);
        }

        @Override
        public String toString(){
            return stCountryCode + " " + stFirstThree + " " + stSecondThree + " " + stFour;
        }
    }

    public static void main(String[] args) {
        Telephone tmp = new Telephone("+104289652211");
        System.out.println(tmp);
    }
}
