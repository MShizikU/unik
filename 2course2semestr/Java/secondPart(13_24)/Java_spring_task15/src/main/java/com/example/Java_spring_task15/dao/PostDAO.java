package com.example.Java_spring_task15.dao;

import com.example.Java_spring_task15.models.Post;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.NoArgsConstructor;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Component
@NoArgsConstructor
public class PostDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public List<Post> findAll() {
        Session session = entityManager.unwrap(Session.class);
        return session.createQuery("select p from Post p", Post.class).getResultList();
    }

    @Transactional
    public void save(Post post) {
        Session session = entityManager.unwrap(Session.class);
        session.persist(post);
    }

    @Transactional
    public void delete(int id) {
        Session session = entityManager.unwrap(Session.class);
        Post post = session.get(Post.class, id);
        session.remove(post);
    }
}
