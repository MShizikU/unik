package ru.mirea.auth.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import ru.mirea.auth.jwt.JwtHelper;
import ru.mirea.auth.model.CustomUserDetailsService;
import ru.mirea.auth.security.service.JwtAuthenticationFilter;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private CustomAuthenticationProvider authProvider;

    private CustomUserDetailsService userDetailsService;
    private JwtHelper tokenHelper;

    public SecurityConfig(CustomUserDetailsService userDetailsService, JwtHelper tokenHelper) {
        this.userDetailsService = userDetailsService;
        this.tokenHelper = tokenHelper;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable()
                .addFilterBefore(new JwtAuthenticationFilter(tokenHelper ), UsernamePasswordAuthenticationFilter.class)
                .authorizeRequests()
                .requestMatchers("/error").permitAll()
                .requestMatchers("/login").permitAll()
                .requestMatchers("/createuser").permitAll()
                .anyRequest().authenticated();


        return http.build();
    }

    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }
    @Bean
    public AuthenticationManager authManager(HttpSecurity http) throws Exception {
        AuthenticationManagerBuilder authenticationManagerBuilder =
                http.getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder.authenticationProvider(authProvider);
        return authenticationManagerBuilder.build();
    }
}
