package ru.mirea.auth.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


@Configuration
public class JwtConfiguration {
    @Value("{app.security.jwt.secret}")
    private String jwtSecret;

    @Bean
    public JwtDecoder jwtDecoder(){
        byte[] key = jwtSecret.getBytes();
        SecretKey originalKey = new SecretKeySpec(key, 0, key.length, "AES");
        return NimbusJwtDecoder.withSecretKey(originalKey).build();
    }
}
