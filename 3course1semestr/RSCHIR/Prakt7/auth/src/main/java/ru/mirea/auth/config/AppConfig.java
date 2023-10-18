package ru.mirea.auth.config;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import ru.mirea.auth.model.User;

@SpringBootConfiguration
public class AppConfig {

    RedisStandaloneConfiguration standaloneoconfig() {
        RedisStandaloneConfiguration standaloneoconfig = new RedisStandaloneConfiguration("redis", 6379);
        return standaloneoconfig;
    }

    @Bean
    JedisConnectionFactory jedisConnFactory() {

        JedisConnectionFactory jcf = new JedisConnectionFactory(standaloneoconfig());
        return jcf;

    }

    @Bean
    RedisTemplate<String, User> redisTemplate() {
        RedisTemplate<String, User> redisTemplate = new RedisTemplate<String, User>();
        redisTemplate.setConnectionFactory(jedisConnFactory());

        return redisTemplate;

    }

}
