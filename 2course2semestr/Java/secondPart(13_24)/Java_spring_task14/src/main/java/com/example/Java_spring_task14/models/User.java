package com.example.Java_spring_task14.models;

import lombok.Data;

@Data
public class User {
    private String firstName;
    private String lastName;
    private String middleName;
    private String birthDate;

    public User(String firstName, String lastName, String middleName, String birthDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.birthDate = birthDate;
    }
}
