package pract7.task5_6;

public class ProccessString implements StringWork{

    String stUserString;

    ProccessString(String stUserString){
        this.stUserString = stUserString;
    }

    public String getUserString() {
        return stUserString;
    }

    public void setUserString(String stUserString) {
        this.stUserString = stUserString;
    }

    @Override
    public int getLength() {
        return stUserString.length();
    }

    @Override
    public String getSomeChars() {
        String tmp = "";
        for(int i = 0; i < getLength(); i++){
            if (i % 2 == 1) tmp += stUserString.charAt(i);
        }
        return tmp;
    }

    @Override
    public String reverseString() {
        String tmp = "";
        for(int i = getLength() - 1; i >= 0; i--){
            tmp += stUserString.charAt(i);
        }
        return tmp;
    }
}
