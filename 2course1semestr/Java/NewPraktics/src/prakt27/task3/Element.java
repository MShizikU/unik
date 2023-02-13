package prakt27.task3;

public class Element {
    float Key;
    String value;
    Element next = null;

    Element(float iKey, String value){
        this.Key = iKey;
        this.value = value;
    }

    public void addNext(Element next){
        this.next = next;
    }

    @Override
    public String toString(){
        return "Element: " + Key + " " + value;
    }
}
