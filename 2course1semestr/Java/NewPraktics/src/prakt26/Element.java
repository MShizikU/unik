package prakt26;

public class Element {
    int Key;
    String value;
    Element next = null;

    Element(int iKey, String value){
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
