package com.example.Java_spring_task14.models;

import lombok.Data;

@Data
public class Post {
    private  String text;

    public Post(String text, String creationDate) {
        this.text = text;
        this.creationDate = creationDate;
    }

    private String creationDate;

}
