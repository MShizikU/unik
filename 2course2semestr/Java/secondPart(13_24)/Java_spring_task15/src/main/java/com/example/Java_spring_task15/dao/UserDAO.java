package com.example.Java_spring_task15.dao;

import com.example.Java_spring_task15.models.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.NoArgsConstructor;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@NoArgsConstructor
@Component
public class UserDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public List<User> findAll() {
        Session session = entityManager.unwrap(Session.class);
        return session.createQuery("from User", User.class).getResultList();
    }

    @Transactional
    public void save(User user) {
        Session session = entityManager.unwrap(Session.class);
        session.persist(user);
    }

    @Transactional
    public void delete(int id) {
        Session session = entityManager.unwrap(Session.class);
        User user = session.get(User.class, id);
        session.remove(user);
    }
}
