package prakt29;

import java.util.Objects;

public final class Dish implements Item {
    private final int iPrice;
    private final String stName;
    private final String stDiscription;


    Dish(int iPrice, String stName, String stDiscription) {
        if(stDiscription.isEmpty() || iPrice < 0 || stName.isEmpty()) throw new java.lang.IllegalArgumentException();

        this.stDiscription = stDiscription;
        this.iPrice = iPrice;
        this.stName = stName;

    }

    @Override
    public int getCost() {
        return iPrice;
    }

    @Override
    public String getName() {
        return stName;
    }

    @Override
    public String getDiscription() {
        return stDiscription;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        var that = (Dish) obj;
        return this.iPrice == that.iPrice &&
                Objects.equals(this.stName, that.stName) &&
                Objects.equals(this.stDiscription, that.stDiscription);
    }

    @Override
    public int hashCode() {
        return Objects.hash(iPrice, stName, stDiscription);
    }

    @Override
    public String toString() {
        return "Dish[" +
                "iPrice=" + iPrice + ", " +
                "stName=" + stName + ", " +
                "stDiscription=" + stDiscription + ']';
    }


}
