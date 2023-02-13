
public class Prakt5{

    public static void main(String[] args){
        System.out.println(SumBasedLength(3,5, 1));
        System.out.println(SumNumeric(23753285));
        System.out.println(isPalindrome("asdfghhgfsa"));
        System.out.println(isSimpleSqrt(997,2));
        System.out.println(isSimpleFastFerma(5,0));

        System.out.println(getSimpleDeviders(2,12));
    }

    public static int SumBasedLength(int k, int s, int c){
        int resCount = 0;

        for (int i = c; i < 10; i++){
            if((s-i) >= 0 && k != 1){
                resCount += SumBasedLength(k-1,s-i, 0);
            }else if ((s-i) == 0 && k == 1){
                resCount ++;
            }
        }
        return resCount;
    }

    public static long SumNumeric(long N){
        if (N/10 != 0 ){
            return N%10 + SumNumeric(N/10);
        }else{
            return N%10;
        }
    }

    public static boolean isPalindrome(String str){
        if (str.length() == 1){
            return true;
        }
        else if (str.substring(0,1).equals(str.substring(str.length()-1,str.length()))) {
            if (str.length() == 2){
                return true;
            }
            else{
                return isPalindrome(str.substring(0,str.length()-1));
            }
        }
        else{
            return false;
        }
    }

    public static boolean isSimpleSqrt(int iNumeric, int iDevider){
        if (iDevider + 1 == iNumeric && iNumeric % iDevider != 0){
            return true;
        }
        if (iDevider + 1 < iNumeric && iNumeric % iDevider != 0){
            return isSimpleSqrt(iNumeric, iDevider + 1);
        }
        else{
            return false;
        }
    }

    public static boolean isSimpleFastFerma(int x, int iCount){
        int devider = (int)(Math.random()%(x-2)+2);
        if (x==2){
            return true;
        }
        if(gcd(devider,x) != 1){
            return false;
        }
        else if((long)Math.pow(devider,x-1)%x != 1){
            return false;
        }
        else if(iCount <=10) {
            return isSimpleFastFerma(x, ++iCount);
        }
        else{
            return true;
        }

    }

    public static long gcd(long a, long b) {
        if (a < b){
            long tmp = b;
            b = a;
            a = tmp;
        }
        if (b==0 || a == 0){
            return Math.max(a, b);
        } else {
            return gcd(a % b, b);
        }
    }

    public static String getSimpleDeviders (int iSimpleNumeric, int iCurrentNumber){
        if (iCurrentNumber == 1)  return "";

        if (isSimpleFastFerma(iSimpleNumeric, 0) && iCurrentNumber % iSimpleNumeric == 0){

            return iSimpleNumeric + " " + getSimpleDeviders(iSimpleNumeric, iCurrentNumber / iSimpleNumeric);

        }
        else {

            return getSimpleDeviders(iSimpleNumeric + 1, iCurrentNumber);

        }
    }






}
