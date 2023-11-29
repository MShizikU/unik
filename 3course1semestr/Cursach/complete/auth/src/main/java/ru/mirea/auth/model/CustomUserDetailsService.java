package ru.mirea.auth.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {


    @Autowired
    private RedisTemplate<String, User> redisTemplate;

    public CustomUserDetailsService(RedisTemplate<String, User> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = (User) redisTemplate.opsForValue().get(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                user.getPassword(),
                user.getCredRoles()
        );
    }

    public void createUser(User user) {
        redisTemplate.opsForValue().set(user.getUsername(), user);
    }

    public void updateUser(String username, User user) {
        redisTemplate.opsForValue().set(username, user);
    }
}

