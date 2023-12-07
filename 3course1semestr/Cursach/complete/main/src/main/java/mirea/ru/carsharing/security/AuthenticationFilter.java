package mirea.ru.carsharing.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import mirea.ru.carsharing.exceptions.CustomUnathorizedException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.HandlerMapping;

import java.io.IOException;
import java.util.logging.Logger;

// ...

@Order(Ordered.HIGHEST_PRECEDENCE)
public class AuthenticationFilter extends AbstractAuthenticationProcessingFilter {

    private static final Logger logger = Logger.getLogger(AuthenticationFilter.class.getName());

    private final ObjectMapper objectMapper;

    public AuthenticationFilter(ObjectMapper objectMapper) {
        super(new AntPathRequestMatcher("/api/**"));
        this.objectMapper = objectMapper;
    }

    @SneakyThrows
    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws IOException {
        logger.info("Attempting authentication...");
        String token = request.getHeader("Authorization");
        if (token == null) {
            token = request.getParameter("token");
        }
        if (token != null) {
            logger.info("Extracting token from request header...");
            if (token.startsWith("Bearer ")) {
                token = token.substring(7);
            }

            logger.info("Validating token...");
            try {
                String sourceUrl = "http://authservice:8081/api/auth";
                HttpHeaders sourceHeaders = new HttpHeaders();
                sourceHeaders.set("Authorization", token);
                HttpEntity<?> requestEntity = new HttpEntity<>(sourceHeaders);
                ResponseEntity<String> sourceResponseEntity = new RestTemplate().exchange(sourceUrl, HttpMethod.GET, requestEntity, String.class);
                Authentication authentication = AuthentificationConverter.convert(sourceResponseEntity.getBody());

                logger.info("Auth: " + authentication);
                logger.info("Set auth");
                SecurityContextHolder.getContext().setAuthentication(authentication);

                logger.info("Authentication successful");
                return authentication;
            } catch (Exception e) {
                logger.info(request.toString());
                logger.info("Error processing authentication request: " + e.getMessage());
                throw new CustomUnathorizedException("User unauthorized");
            }
        }
        logger.info("Something went wrong");
        throw new CustomUnathorizedException("User unauthorized");
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException, ServletException {
        SecurityContextHolder.getContext().setAuthentication(authResult);
        chain.doFilter(request, response);
    }
}
