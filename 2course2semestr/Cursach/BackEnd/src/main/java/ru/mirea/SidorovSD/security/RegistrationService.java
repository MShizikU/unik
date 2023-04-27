package ru.mirea.SidorovSD.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Repos.UserRepo;

public class RegistrationService {

    private UserRepo userRepo;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public RegistrationService(UserRepo userRepo, PasswordEncoder passwordEncoder) {
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    public void registrate(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("ROLE_USER");
        userRepo.save(user);
    }

}
