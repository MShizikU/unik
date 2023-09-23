import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class SquareEquationSolverImpl extends UnicastRemoteObject implements SquareRootSolver {
    private static final long serialVersionUID = 1L;

    protected SquareEquationSolverImpl() throws RemoteException {
        super();
    }

    @Override
    public double[] solveSquareEquation(double a, double b, double c) throws RemoteException {
        double discriminant = b * b - 4 * a * c;
        double[] roots;

        if (discriminant > 0) {
            double root1 = (-b + Math.sqrt(discriminant)) / (2 * a);
            double root2 = (-b - Math.sqrt(discriminant)) / (2 * a);
            roots = new double[]{root1, root2};
        } else if (discriminant == 0) {
            double root = -b / (2 * a);
            roots = new double[]{root};
        } else {
            roots = new double[0];
        }

        return roots;
    }
}