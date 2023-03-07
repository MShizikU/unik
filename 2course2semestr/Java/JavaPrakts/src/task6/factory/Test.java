package task6.factory;

public class Test {
    public static void main(String[] args) {
        Factory roadTranstort = new RoadCreator();
        for (int i=0;i<3;i++){
            roadTranstort.doTransport();
        }

        Factory seaTransport = new SeaCreator();
        seaTransport.doTransport();

    }
}
