package com.example.Java_spring_task15.utils;

public class PostNotFoundException extends Exception{
    public PostNotFoundException() {
        super("Post not found");
    }
}
