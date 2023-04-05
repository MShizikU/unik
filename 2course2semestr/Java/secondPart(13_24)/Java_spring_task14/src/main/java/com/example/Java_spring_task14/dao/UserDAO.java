package com.example.Java_spring_task14.dao;

import com.example.Java_spring_task14.models.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserDAO {
    private ArrayList<User> users;

    public UserDAO() {
        users = new ArrayList<>();
        users.add(new User("Stas", "Sidorov", "Dmitr.", "06.03.2004"));
        users.add(new User("Vitya", "Vitorov", "Dmitr.", "07.03.2004"));
        users.add(new User("Kolya", "Kilorov", "Dmitr.", "08.03.2004"));
        users.add(new User("Roma", "Rimorov", "Dmitr.", "09.03.2004"));
        users.add(new User("Lexa", "Lixorov", "Dmitr.", "10.03.2004"));
    }

    public List<User> findAll() {
        return users;
    }

    public void save(User user) {

        users.add(user);
    }

    public void delete(String birthDate) {
        users.removeIf(it -> it.getBirthDate().equals(birthDate));
    }
}
