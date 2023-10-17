package mirea.ru.prakt6.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;

// ...

public class CustomAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

    private final RestTemplate restTemplate;
    private final String otherAppUrl;

    public CustomAuthenticationFilter( RestTemplate restTemplate, String otherAppUrl) {
        super(new AntPathRequestMatcher("/auth", HttpMethod.POST.name()));
        this.restTemplate = restTemplate;
        this.otherAppUrl = otherAppUrl;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, IOException, ServletException {
        // Extract the Authorization header from the request
        String authorizationHeader = request.getHeader("Authorization");

        // Create the request headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", authorizationHeader);

        // Create the request entity with the headers
        HttpEntity<?> requestEntity = new HttpEntity(headers);

        // Send the request to the other application for authentication
        ResponseEntity<?> authenticationResponse = restTemplate.exchange(otherAppUrl, HttpMethod.GET, requestEntity, Object.class);

        // Check the response and determine if the user should be allowed or not
        if (authenticationResponse.getStatusCode().is2xxSuccessful()) {
            // User is authenticated, create the authentication object
            Authentication authentication = new UsernamePasswordAuthenticationToken(authorizationHeader, null);

            // Return the authentication object to be authenticated by the AuthenticationManager
            return getAuthenticationManager().authenticate(authentication);
        } else {
            // User is not authenticated, return null to indicate authentication failure
            return null;
        }
    }
}
