package com.example.Java_spring_task24.dto;

import com.example.Java_spring_task24.models.Post;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class UserDTO {
    private String firstName, lastName, middleName, birthDate;
    private List<Post> postList;
}
