public class Tests {

    public static void main(String[] args){
        //System.out.println(new StackGame().game("12345","67890"));
        System.out.println(new QueueGame().game("13579","24680"));
        System.out.println(new DequeueGame().game("13579","24680"));
        System.out.println(new DoubleListGame().game("13579","24680"));
        new StackGameWithInterface().setVisible(true);
    }

}
