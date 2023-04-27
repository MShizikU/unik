package ru.mirea.SidorovSD.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Repos.UserRepo;

import java.util.Optional;

@Service
public class userDetailsService implements UserDetailsService {

    private UserRepo userRepo;

    @Autowired
    public userDetailsService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = userRepo.findByUsername("Shiz");
        if(user.isEmpty())
            throw new UsernameNotFoundException("User not found");
        return new userDetails(user.get());
    }

}
