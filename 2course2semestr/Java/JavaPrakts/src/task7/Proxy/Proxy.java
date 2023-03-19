package task7.Proxy;

public class Proxy implements Service{

    private RealObject object;

    @Override
    public String operation(String data) {
        if (data.contains("For proxy")){
            return "Proxy worked";
        }else{
            object = new RealObject();

            return object.operation(data);
        }
    }
}
