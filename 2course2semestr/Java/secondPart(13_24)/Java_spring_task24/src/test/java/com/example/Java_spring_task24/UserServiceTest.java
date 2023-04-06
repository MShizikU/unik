package com.example.Java_spring_task24;

import com.example.Java_spring_task24.models.User;
import com.example.Java_spring_task24.repositories.UserRepository;
import com.example.Java_spring_task24.services.UserService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

@ExtendWith(MockitoExtension.class)
public class UserServiceTest {
    @Mock
    private UserRepository userRepository;


    @Captor
    ArgumentCaptor<User> captor;

    @Test
    void getUsers() {
        User user = new User();
        user.setFirstName("Test 1");
        User user1 = new User();
        user1.setFirstName("Test 1");
        User user2 = new User();
        user2.setFirstName("Test 1");

        Mockito.when(userRepository.findAll()).thenReturn(List.of(user, user1, user2));
        UserService service = new UserService(userRepository);
        Assertions.assertEquals(3, service.findAll().size());
        Assertions.assertEquals(user, service.findAll().get(0));
    }

    @Test
    void save() {
        User user = new User();
        user.setFirstName("Test 1");

        UserService service = new UserService(userRepository);
        service.save(user);
        Mockito.verify(userRepository).save(captor.capture());
        User user1 = captor.getValue();

        Assertions.assertEquals("Test 1", user1.getFirstName());
    }
}
