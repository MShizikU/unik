package ru.mirea.auth.security;

import jakarta.servlet.Filter;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationProvider;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import ru.mirea.auth.security.service.ServiceAuthenticationProvider;
import ru.mirea.auth.security.service.ServiceTokenAuthenticationFilter;

import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig{

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .addFilterAfter(
                        new ServiceTokenAuthenticationFilter(new ServiceAuthenticationProvider()),
                        BasicAuthenticationFilter.class)
                .authorizeRequests(configurer -> configurer
                        .anyRequest()
                        .authenticated()
                )
                .oauth2ResourceServer(obj -> obj.jwt(Customizer.withDefaults()));

        return http.build();
    }
}
