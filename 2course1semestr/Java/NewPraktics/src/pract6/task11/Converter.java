package pract6.task11;

interface Converter {
    double getConvertedValue(double baseValue);
}


class KelvinConverter implements Converter {

    @Override
    public double getConvertedValue(double dbValue) {
        return dbValue + 273;
    }
}

class FahrenheitConverter implements Converter {
    @Override
    public double getConvertedValue(double dbValue) {
        return 1.8 * dbValue + 32;
    }
}