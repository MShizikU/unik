package com.authservice.controller;

import com.authservice.dto.AuthRequest;
import com.authservice.dto.RegisterResponse;
import com.authservice.entiry.UserCredential;
import com.authservice.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.nio.file.attribute.UserPrincipalNotFoundException;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {
    private final AuthService service;
    private final AuthenticationManager authenticationManager;

    @PostMapping("/register")
    public RegisterResponse addNewUser(@RequestBody UserCredential user) {
        UserCredential credential = service.saveUser(user);
        return new RegisterResponse(
                credential.getId(),
                credential.getUsername(),
                credential.getEmail()
        );
    }

    @PostMapping("/token")
    @Cacheable(value = "userAuthenticationCache", key = "#request.username")
    public String getToken(@RequestBody AuthRequest request) throws UserPrincipalNotFoundException {
        Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                request.username(),
                request.password())
        );

        if (authenticate.isAuthenticated())
            return service.generateToken(request.username());
        else
            throw new RuntimeException("invalid access");
    }

    @GetMapping("/validate")
    public void validateToken(@RequestParam String token) {
        service.validateToken(token);
    }
}
