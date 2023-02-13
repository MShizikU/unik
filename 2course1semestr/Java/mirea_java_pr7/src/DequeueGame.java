import java.util.Deque;
import java.util.LinkedList;

public class DequeueGame implements interfaceGame{

    private Deque<Integer> dequeFirstPlayer;
    private Deque<Integer> dequeSecondPlayer;
    private int iCount = 0;

    public String game(String stFirstPlayerCards, String stSecondPlayerCards){
        dequeFirstPlayer = stringToCards(stFirstPlayerCards);
        dequeSecondPlayer = stringToCards(stSecondPlayerCards);

        while (iCount != 106 && !dequeFirstPlayer.isEmpty() && !dequeSecondPlayer.isEmpty()){
            if (gameComparator(dequeFirstPlayer.peekFirst(), dequeSecondPlayer.peekFirst()) < 0){
                getTwoCards(dequeSecondPlayer,dequeFirstPlayer);
            }
            else{
                getTwoCards(dequeFirstPlayer, dequeSecondPlayer);
            }
            iCount++;
        }

        return getResult(dequeFirstPlayer.isEmpty(), dequeSecondPlayer.isEmpty(), iCount);
    }

    private Deque<Integer> stringToCards(String stPlayerCards){
        Deque<Integer> tmp = new LinkedList<Integer>();
        for(int i = 0; i < stPlayerCards.length(); i++){
            tmp.add(Integer.parseInt(stPlayerCards.substring(i,i+1)));
        }
        return tmp;
    }

    private void getTwoCards(Deque<Integer> dequeWinner, Deque<Integer> dequeLoser){
        dequeWinner.add(dequeWinner.peekFirst());
        dequeWinner.removeFirst();
        dequeWinner.add(dequeLoser.peekFirst());
        dequeLoser.removeFirst();
    }

}
