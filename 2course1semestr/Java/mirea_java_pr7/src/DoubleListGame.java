import java.util.LinkedList;

public class DoubleListGame implements interfaceGame{
    private LinkedList<Integer> listFirstPlayer;
    private LinkedList<Integer> listSecondPlayer;
    private int iCount = 0;

    public String game(String stFirstPlayerCards, String stSecondPlayerCards){
        listFirstPlayer = stringToCards(stFirstPlayerCards);
        listSecondPlayer = stringToCards(stSecondPlayerCards);

        while (iCount != 106 && !listFirstPlayer.isEmpty() && !listSecondPlayer.isEmpty()){
            if (gameComparator(listFirstPlayer.getFirst(),listSecondPlayer.getFirst()) < 0){
                getTwoCards(listSecondPlayer,listFirstPlayer);
            } else{
                getTwoCards(listFirstPlayer, listSecondPlayer);
            }
            iCount++;
        }

        return getResult(listFirstPlayer.isEmpty(), listSecondPlayer.isEmpty(), iCount);
    }

    private LinkedList<Integer> stringToCards(String stPlayerCards){
        LinkedList<Integer> tmp = new LinkedList<>();
        for(int i = 0; i < stPlayerCards.length(); i++){
            tmp.add(Integer.parseInt(stPlayerCards.substring(i,i+1)));
        }
        return tmp;
    }

    private void getTwoCards(LinkedList<Integer> listWinner, LinkedList<Integer> listLoser){
        listWinner.add(listWinner.removeFirst());
        listWinner.add(listLoser.removeFirst());
    }

}
