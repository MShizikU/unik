package pract6.task13;

import pract6.task12.MyStringBuilder;

public class MyListener implements OnStringBuilderChangeListener{


    @Override
    public void onChange(pract6.task13.MyStringBuilder stringBuilder) {
        System.out.println("New version: " + stringBuilder.toString());
    }
}
