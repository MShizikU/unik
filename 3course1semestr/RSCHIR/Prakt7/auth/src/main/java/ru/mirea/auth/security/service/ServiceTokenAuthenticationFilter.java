package ru.mirea.auth.security.service;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.core.log.LogMessage;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ServiceTokenAuthenticationFilter extends OncePerRequestFilter {
    private final ServiceAuthenticationProvider authenticationManager;
    private final Pattern authorizationPattern;

    public ServiceTokenAuthenticationFilter(ServiceAuthenticationProvider authenticationManager) {
        this.authenticationManager = authenticationManager;
        authorizationPattern = Pattern.compile(
                "^Service (?<token>[a-zA-Z0-9-._~+/]+=*)$",
                Pattern.CASE_INSENSITIVE
        );
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) {
        String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (!StringUtils.startsWithIgnoreCase(authorizationHeader, "service")) {
            try {
                filterChain.doFilter(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }
        Matcher matcher = authorizationPattern.matcher(authorizationHeader);
        if (!matcher.matches()) {
            throw new AuthenticationServiceException("Service token is malformed");
        }
        String token = matcher.group("token");
        try {
            Authentication authenticationResult = authenticationManager.authenticate(new ServiceAuthenticationToken(token));
            SecurityContextHolder.setContext(SecurityContextHolder.createEmptyContext());
            SecurityContextHolder.getContext().setAuthentication(authenticationResult);
            if (logger.isDebugEnabled()) {
                this.logger.debug(String.format("Set SecurityContextHolder to %s", authenticationResult));
            }
            filterChain.doFilter(request, response);
        } catch (AuthenticationException | IOException | ServletException failed) {
            SecurityContextHolder.clearContext();
            logger.trace("Failed to process authentication request", failed);
        }
    }
}
