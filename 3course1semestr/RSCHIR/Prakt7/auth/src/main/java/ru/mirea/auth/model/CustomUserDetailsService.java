package ru.mirea.auth.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User fakeUser = new User("Stas", "password", new ArrayList<>());
        return new org.springframework.security.core.userdetails.User(
                fakeUser.getUsername(),
                fakeUser.getPassword(),
                fakeUser.getRoles()
        );
    }
}

