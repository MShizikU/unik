import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public interface SquareRootSolver extends Remote {
    double[] solveSquareEquation(double a, double b, double c) throws RemoteException;

}