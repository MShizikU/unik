package com.example.Java_spring_task19.dto;

import com.example.Java_spring_task19.models.User;
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
