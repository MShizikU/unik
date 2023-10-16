package ru.mirea.auth.security.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.Objects;

@Component
public class ServiceAuthenticationProvider implements AuthenticationProvider {
    @Value("${app.security.service.token}")
    private String serviceToken;

    @Override
    public Authentication authenticate(Authentication authentication) {
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        if (isServiceTokenValid((ServiceAuthenticationToken) authentication)) {
            return new UsernamePasswordAuthenticationToken(name, password, Collections.emptyList());
        } else {
            throw new AuthenticationServiceException("Unknown service " + authentication.getName());
        }
    }

    private boolean isServiceTokenValid(ServiceAuthenticationToken authentication) {
        return authentication.getToken().equals(serviceToken);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return Objects.equals(authentication, ServiceAuthenticationToken.class);
    }
}
