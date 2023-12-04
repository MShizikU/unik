package mirea.ru.carsharing.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.logging.Logger;

// ...

public class AuthenticationFilter extends OncePerRequestFilter {

    @Value("${AUTH_SERVICE_PORT}")
    private String authServicePort;

    private static final Logger logger = Logger.getLogger(AuthenticationFilter.class.getName());

    private final ObjectMapper objectMapper;

    public AuthenticationFilter(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            String sourceUrl = "http://authservice:" + authServicePort + "/api/auth";

            logger.info("Authorization token: " + request.getHeader("Authorization"));

            HttpMethod sourceMethod = HttpMethod.GET;
            HttpHeaders sourceHeaders = new HttpHeaders();
            sourceHeaders.set("Authorization", request.getHeader("Authorization"));
            HttpEntity<?> sourceRequestEntity = new HttpEntity<>(sourceHeaders);
            ResponseEntity<String> sourceResponseEntity = new RestTemplate().exchange(sourceUrl, sourceMethod, sourceRequestEntity, String.class);

            logger.info("Parse auth");
            logger.info("Response body: " + sourceResponseEntity.getBody());
            Authentication authentication = AuthentificationConverter.convert(sourceResponseEntity.getBody());

            logger.info("Auth: " + authentication);
            logger.info("Set auth");
            SecurityContextHolder.getContext().setAuthentication(authentication);

            logger.info("Do filter");
            filterChain.doFilter(request, response);
        } catch (Exception e) {
            logger.info("Error processing authentication request");
            throw e;
        }
    }
}
