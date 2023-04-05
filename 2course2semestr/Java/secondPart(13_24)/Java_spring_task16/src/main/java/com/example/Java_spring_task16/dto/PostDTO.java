package com.example.Java_spring_task16.dto;

import com.example.Java_spring_task16.models.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostDTO {
    private String text, creationDate;
    private User user;
}
