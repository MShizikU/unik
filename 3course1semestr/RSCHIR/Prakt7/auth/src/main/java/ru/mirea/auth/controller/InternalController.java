package ru.mirea.auth.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

@RestController
@RequestMapping("/api")
public class InternalController {

    private final Logger logger = Logger.getLogger(InternalController.class.getName());

    @GetMapping("/userDetails")
    public String getUser(Authentication authentication) {
        logger.info("TODO: obtain user name for user " + authentication.getName());
        return "Stas";
    }

    @GetMapping("/users")
    public List<String> getUsers() {
        return Arrays.asList("user@mail.com");
    }
}
