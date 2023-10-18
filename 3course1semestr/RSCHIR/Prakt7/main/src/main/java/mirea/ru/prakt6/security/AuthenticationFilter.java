package mirea.ru.prakt6.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.FilterChain;
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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.StreamUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.logging.Logger;

// ...

public class AuthenticationFilter extends OncePerRequestFilter {

    private static final Logger logger = Logger.getLogger(AuthenticationFilter.class.getName());

    private final ObjectMapper objectMapper;

    public AuthenticationFilter(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            logger.info("Start auth");
            URL url = new URL("http://localhost:8082/api/auth");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestProperty("Authorization", request.getHeader("Authorization"));
            connection.setRequestMethod("GET");
            String responseBody = StreamUtils.copyToString(connection.getInputStream(), StandardCharsets.UTF_8);

            logger.info("Parse auth");
            Authentication authentication = objectMapper.readValue(responseBody, Authentication.class);

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
