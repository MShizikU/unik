package com.example.Java_spring_task16.dao;

import com.example.Java_spring_task16.models.Post;
import jakarta.persistence.EntityManager;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class PostDAO {
    private EntityManager entityManager;

    @Autowired
    public PostDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

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
