package ru.mirea.auth.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

public class User implements Serializable {
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    String username;
    String password;
    String roles;

    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.roles = role;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRoles() {
        return roles;
    }

    public Collection<GrantedAuthority> getCredRoles(){
        Collection<GrantedAuthority> creds = new ArrayList<>();
        creds.add(new SimpleGrantedAuthority("ROLE_" + roles));
        return creds;
    }
}
