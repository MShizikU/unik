import java.util.Stack;

public class StackGame implements interfaceGame{

    private Stack<Integer> stackFirstPlayer;
    private Stack<Integer> stackSecondPlayer;

    private int iCount = 0;

    public String game(String stFirstPlayerCards, String stSecondPlayerClass){
        stackFirstPlayer = stringToCards(stFirstPlayerCards);
        stackSecondPlayer = stringToCards(stSecondPlayerClass);
        while (iCount != 106 && !stackFirstPlayer.empty() && !stackSecondPlayer.empty()){
            if (gameComparator(stackFirstPlayer.peek(), stackSecondPlayer.peek()) < 0){
                getTwoCards(stackSecondPlayer, stackFirstPlayer.pop());
            } else{
                getTwoCards(stackFirstPlayer, stackSecondPlayer.pop());
            }
            iCount++;
        }

        return getResult(stackFirstPlayer.empty(), stackSecondPlayer.empty(), iCount);
    }

    private Stack<Integer> stringToCards(String playerCards){
        Stack<Integer> tmp = new Stack<Integer>();
        for(int i = playerCards.length()-1; i >= 0; i--){
            tmp.push(Integer.parseInt(playerCards.substring(i, i + 1)));
        }
        return tmp;
    }

    private void getTwoCards(Stack<Integer> playerCards, Integer enemyCard){
        Stack<Integer> tmp = new Stack<>();
        while (!playerCards.empty()){
            tmp.push(playerCards.pop());
        }
        tmp.push(enemyCard);
        while (!tmp.empty()){
            playerCards.push(tmp.pop());
        }

    }

}
