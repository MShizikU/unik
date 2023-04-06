package com.example.Java_spring_task24.dto;

import com.example.Java_spring_task24.models.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostDTO {
    private String text, creationdate;
    private User user;
}
