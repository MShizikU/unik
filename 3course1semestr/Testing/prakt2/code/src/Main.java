public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
    }

    public static String solveQuadraticEquation(double a, double b, double c) {
        double discriminant = b * b - 4 * a * c;

        if (discriminant < 0) {
            return "none";  // No real solutions
        } else if (discriminant == 0) {
            double root = -b / (2 * a);
            return String.valueOf(root);
        } else {
            double root1 = (-b + Math.sqrt(discriminant)) / (2 * a);
            double root2 = (-b - Math.sqrt(discriminant)) / (2 * a);
            return root1 + "/" + root2;
        }
    }

    public static String solveCubicEquation(double a, double b, double c, double d) {
        if (a == 0) {
            double discriminant = c * c - 4 * b * d;

            if (discriminant < 0) {
                return "none";
            } else if (discriminant == 0) {
                double root = -c / (2 * b);
                return String.valueOf(root);
            } else {
                double root1 = (-c + Math.sqrt(discriminant)) / (2 * b);
                double root2 = (-c - Math.sqrt(discriminant)) / (2 * b);
                return root1 + "/" + root2;
            }
        }

        double discriminant1 = b * b - 3 * a * c;
        double discriminant2 = 2 * Math.pow(b, 3) - 9 * a * b * c + 27 * a * a * d;

        if (discriminant1 == 0 && discriminant2 == 0) {  // All solutions are real and equal
            double solution = -b / (3 * a);
            return String.valueOf(solution);
        } else if (discriminant2 == 0) {  // Two solutions are real and equal, one is different
            double solution1 = (9 * a * d - b * c) / (2 * discriminant1);
            double solution2 = -solution1/2;
            return solution1 + "/" + solution2;
        } else {  // All solutions are real and different
            double C = Math.cbrt((discriminant2 + Math.sqrt(discriminant2 * discriminant2 - 4 * discriminant1 * discriminant1 * discriminant1))/2);
            double u = -b / (3 * a);
            double solution1 = u + C + discriminant1 / (C * 3 * a);
            double solution2 = u - (C + discriminant1/(C * 3 * a))/2;
            double solution3 = u - (C + discriminant1/(C * 3 * a))/2;
            return solution1 +  "/" + solution2  + "/" + solution3;
        }
    }
}