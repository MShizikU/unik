package task7.Proxy;

public class RealObject implements Service{
    @Override
    public String operation(String data) {
        return "The work of real project";
    }
}
