package com.example.Java_spring_task16.utils;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostResponse {
    private String message;

    public PostResponse(String message) {
        this.message = message;
    }
}
