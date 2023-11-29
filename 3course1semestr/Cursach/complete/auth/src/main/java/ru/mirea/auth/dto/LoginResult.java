package ru.mirea.auth.dto;


public class LoginResult {
    public String jwt;

    public LoginResult(String jwt) {
        this.jwt = jwt;
    }
}
