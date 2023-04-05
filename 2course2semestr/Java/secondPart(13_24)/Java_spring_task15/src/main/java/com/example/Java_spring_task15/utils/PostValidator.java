package com.example.Java_spring_task15.utils;

import com.example.Java_spring_task15.models.Post;
import org.springframework.stereotype.Component;

@Component
public class PostValidator {
    public boolean validate(Post post) {
        if(post.getText()== null || post.getCreationDate() == null)
            return false;
        return true;
    }
}
