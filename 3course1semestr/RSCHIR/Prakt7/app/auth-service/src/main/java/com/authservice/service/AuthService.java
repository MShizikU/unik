package com.authservice.service;

import com.authservice.entiry.Role;
import com.authservice.entiry.UserCredential;
import com.authservice.repository.UserCredentialRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final PasswordEncoder passwordEncoder;
    private final UserCredentialRepository repository;
    private final JwtService jwtService;

    public UserCredential saveUser(UserCredential credential) {
        credential.addRole(Role.USER);
        credential.setPassword(passwordEncoder.encode(credential.getPassword()));
         return repository.save(credential);
    }

    public String generateToken(String username) throws UserPrincipalNotFoundException {
        Optional<UserCredential> user = repository.findByUsername(username);
        if (user.isEmpty())
            throw new UserPrincipalNotFoundException("No such user");
        return jwtService.generateToken(user.get());
    }

    public void validateToken(String token) {
        jwtService.validateToken(token);
    }
}
