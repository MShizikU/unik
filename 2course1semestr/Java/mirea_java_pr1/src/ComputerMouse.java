public class ComputerMouse {

    private int iClicksCounter = 0;
    private int iEnergy;

    public ComputerMouse(int iEnergy){
        this.iEnergy = iEnergy;
    }

    public ComputerMouse(){
        this.iEnergy = 100;
    }

    public void setEnergy(int iEnergy){
        this.iEnergy = iEnergy;
    }

    public int getEnergy(){
        return iEnergy;
    }

    public int getClicksCounter(){
        return iClicksCounter;
    }

    public void Click(){
        iClicksCounter++;
    }

    public void showInfo(){
        System.out.println("Energy: " + iEnergy + "\nClicks: " + iClicksCounter);
    }

}
