package prakt27.task3;

public class hashtab {

    int realSize;
    int currentSize;

    Element[] table;

    private Integer hashtabHash(float iKey){
        return (int)(0.28163264 * iKey) % currentSize;
    }

    public void hashtabInit(){
        realSize = 0;
        currentSize = 8;
        table = new Element[currentSize];
    }

    public void hashtabAdd(float key, String value){
        int iPlace = hashtabHash(key);

        realSize++;
        if (realSize > currentSize * 0.75) hashtabResize(currentSize * 2);

        if (table[iPlace] == null) table[iPlace] = new Element(key,value);
        else {
            Element tmp = table[iPlace];
            while (tmp.next != null) tmp = tmp.next;
            tmp.addNext(new Element(key,value));
        }

    }

    public void hashtabDelete(float key){
        realSize--;

        int iPlace = hashtabHash(key);

        if(table[iPlace].Key == key ) table[iPlace] = (table[iPlace].next == null)  ? null : table[iPlace].next;
        else if (table[iPlace] != null){
            Element tmp = table[iPlace];
            while (tmp.next != null && tmp.next.Key != key) tmp = tmp.next;
            tmp.next = null;
        }

    }

    public Element hashtabLookUp(float key){
        Element res = table[hashtabHash(key)];
        if (res == null) return null;
        else{
            if (res.Key == key) return res;
            else {
                while (res != null && res.Key != key) res = res.next;
                return res;
            }
        }
    }

    private void hashtabResize(int newSize){
        Element[] newTable = new Element[newSize];

        currentSize = newSize;

        for(Element elem : table){
            if (elem == null) continue;
            int iPlace = hashtabHash(elem.Key);
            if (newTable[iPlace] == null) newTable[iPlace] = elem;
            else {
                Element tmp = newTable[iPlace];
                while (tmp.next != null) tmp = tmp.next;
                tmp.addNext(elem);
            }
        }

        table = newTable;
    }

}


