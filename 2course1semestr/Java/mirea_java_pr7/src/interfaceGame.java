public interface interfaceGame {

    public default int gameComparator(int iFirstPlayerCard, int iSecondPlayerCard){
        if (iFirstPlayerCard == 0 && iSecondPlayerCard == 9){
            return 1;
        }
        else if (iFirstPlayerCard == 9 && iSecondPlayerCard == 0){
            return -1;
        }
        else{
            return iFirstPlayerCard - iSecondPlayerCard;
        }
    }

    public default String getResult (boolean boolFirstPlayerEmptyState, boolean boolSecondPlayerEmptyState, int iCount){
        if(iCount == 106){
            return "botva";
        }
        else if(boolFirstPlayerEmptyState){
            return "second " + iCount;
        }
        else{
            return "first " + iCount;
        }
    }
}
