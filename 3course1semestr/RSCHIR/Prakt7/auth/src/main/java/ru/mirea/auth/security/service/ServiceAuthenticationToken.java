package ru.mirea.auth.security.service;

import org.springframework.security.authentication.AbstractAuthenticationToken;

import static java.util.Collections.emptyList;

public class ServiceAuthenticationToken extends AbstractAuthenticationToken {
    public String getToken() {
        return token;
    }

    private final String token;

    public ServiceAuthenticationToken(String token) {
        super(emptyList());
        this.token = token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }


}
