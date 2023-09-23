import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class Client {
    public static void main(String[] args) {
        try {
            Registry registry = LocateRegistry.getRegistry(2099);
            SquareRootSolver solver = (SquareRootSolver) registry.lookup("Solver");
            double[] a = solver.solveSquareEquation(1,3, 2);
            System.out.println(a.length);
            for (int i = 0; i<a.length; i++){
                System.out.println(a[i]+" ");
            }
        } catch (Exception e) {
            System.err.println("Client exeption" + e.toString());
            e.printStackTrace();
        }
    }
}