package ru.mirea.auth.model;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class User {
    String username;
    String password;
    Collection<GrantedAuthority> roles;

    public User(String username, String password, Collection<GrantedAuthority> roles) {
        this.username = username;
        this.password = password;
        this.roles = roles;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Collection<GrantedAuthority> getRoles() {
        return roles;
    }
}
