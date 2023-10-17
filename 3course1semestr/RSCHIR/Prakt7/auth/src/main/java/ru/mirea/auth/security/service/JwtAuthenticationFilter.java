package ru.mirea.auth.security.service;

import io.jsonwebtoken.Claims;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.mirea.auth.jwt.JwtHelper;
import ru.mirea.auth.model.CustomUserDetailsService;

import java.io.IOException;
import java.util.Map;
import java.util.logging.Logger;

@Order(Ordered.HIGHEST_PRECEDENCE)
public class JwtAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

    private static final Logger logger = Logger.getLogger(JwtAuthenticationFilter.class.getName());

    private JwtHelper tokenHelper;

    public JwtAuthenticationFilter(JwtHelper tokenHelper) {
        super(new AntPathRequestMatcher("/api/**"));
        this.tokenHelper = tokenHelper;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
        logger.info("Attempting authentication...");
        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
        }
        if (token != null) {
            logger.info("Extracting username from token...");
            Map<String, Object> tokenClaims = tokenHelper.extractClaimsFromJwt(token);
            logger.info("claims: " + tokenClaims.toString());
            String username = tokenClaims.get("username").toString();
            String password = tokenClaims.get("password").toString();
            logger.info("Username: " + username);
            return new UsernamePasswordAuthenticationToken(username, password);
        }
        return null;
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException, ServletException {
        SecurityContextHolder.getContext().setAuthentication(authResult);
        chain.doFilter(request, response);
    }
}