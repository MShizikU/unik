package pract6.task13;

public class MyStringBuilder {
    private OnStringBuilderChangeListener onChangeListener;

    private StringBuilder stringBuilder;


    public void setOnChangeListener(OnStringBuilderChangeListener onChangeListener) {
        this.onChangeListener = onChangeListener;
    }

    public MyStringBuilder() {
        stringBuilder = new StringBuilder();
    }

    private void notifyOnStringBuilderChangeListener(){
        if(onChangeListener != null){
            onChangeListener.onChange(this);
        }
    }

    public MyStringBuilder append(Object obj) {
        stringBuilder.append(obj);
        notifyOnStringBuilderChangeListener();
        return this;
    }

    public MyStringBuilder reverse(){
        stringBuilder.reverse();
        notifyOnStringBuilderChangeListener();
        return this;
    }

    public MyStringBuilder replace(int start, int end, String str) {
        stringBuilder.replace(start, end, str);
        notifyOnStringBuilderChangeListener();
        return this;
    }

    public MyStringBuilder insert(int index, char[] str, int offset, int len) {
        stringBuilder.insert(index, str, offset, len);
        notifyOnStringBuilderChangeListener();
        return this;
    }

    public MyStringBuilder delete(int start, int end){
        stringBuilder.delete(start, end);
        notifyOnStringBuilderChangeListener();
        return this;
    }


    public String toString() {
        return stringBuilder.toString();
    }
}
