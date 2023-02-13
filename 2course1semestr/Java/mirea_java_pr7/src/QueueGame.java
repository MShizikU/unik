import java.util.LinkedList;
import java.util.Queue;

public class QueueGame implements interfaceGame{
    
    Queue<Integer> queueFirstPlayer;
    Queue<Integer> queueSecondPlayer;
    
    int iCount = 0;
    
    public String game(String stFirstPlayerCards, String stSecondPlayerCards){
        queueFirstPlayer = stringToCards(stFirstPlayerCards);
        queueSecondPlayer = stringToCards(stSecondPlayerCards);

        while (iCount != 106 && !queueFirstPlayer.isEmpty() && !queueSecondPlayer.isEmpty()){
            if (gameComparator(queueFirstPlayer.peek(),queueSecondPlayer.peek()) < 0){
                getTwoCards(queueSecondPlayer, queueFirstPlayer.peek());
                queueFirstPlayer.remove();
            }
            else{
                getTwoCards(queueFirstPlayer, queueSecondPlayer.peek());
                queueSecondPlayer.remove();
            }
            iCount++;
        }

        return getResult(queueFirstPlayer.isEmpty(), queueSecondPlayer.isEmpty(), iCount);
    }
    
    private Queue<Integer> stringToCards(String stPlayerCards){
        Queue<Integer> tmp = new LinkedList<Integer>();
        for(int i = 0; i < stPlayerCards.length(); i++){
            tmp.add(Integer.parseInt(stPlayerCards.substring(i,i+1)));
        }
        return tmp;
    }

    private void getTwoCards(Queue<Integer> queuePlayerCards, int iEnemyCard){
        queuePlayerCards.add(queuePlayerCards.peek());
        queuePlayerCards.remove();
        queuePlayerCards.add(iEnemyCard);
    }



}
