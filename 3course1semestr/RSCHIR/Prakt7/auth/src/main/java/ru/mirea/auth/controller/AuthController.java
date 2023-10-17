package ru.mirea.auth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import ru.mirea.auth.dto.LoginResult;
import ru.mirea.auth.jwt.JwtHelper;
import ru.mirea.auth.model.CustomUserDetailsService;
import java.util.logging.Logger;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
public class AuthController {

    private static final Logger LOGGER = Logger.getLogger(AuthController.class.getName());

    private final JwtHelper jwtHelper;
    private final CustomUserDetailsService userDetailsService;
    private final PasswordEncoder passwordEncoder;

    public AuthController(JwtHelper jwtHelper, CustomUserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
        this.jwtHelper = jwtHelper;
        this.userDetailsService = userDetailsService;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping(path = "login", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public LoginResult login(@RequestParam String username, @RequestParam String password) {
        LOGGER.info("Received login request for username: " + username + ", password: " + password);
        UserDetails userDetails;

        try {
            userDetails = userDetailsService.loadUserByUsername(username);
        } catch (UsernameNotFoundException e) {
            LOGGER.warning("User not found: " + username);
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not found");
        }
        LOGGER.info("Expected password: " + passwordEncoder.encode(userDetails.getPassword()));
        //if (passwordEncoder.matches(password, userDetails.getPassword()))
        if (password.equals(userDetails.getPassword())){
            LOGGER.info("User authenticated successfully: " + username);
            Map<String, String> claims = new HashMap<>();
            claims.put("username", username);
            String authorities = userDetails.getAuthorities().stream()
                    .map(Object::toString)
                    .collect(Collectors.joining(","));
            claims.put("authorities", authorities);
            claims.put("userId", "1");
            String jwt = jwtHelper.createJwtForClaims(username, claims);
            return new LoginResult(jwt);
        }
        LOGGER.warning("User authentication failed: " + username);
        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not authenticated");
    }
}