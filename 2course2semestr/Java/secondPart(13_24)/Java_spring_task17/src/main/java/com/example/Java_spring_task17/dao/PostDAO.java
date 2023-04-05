package com.example.Java_spring_task17.dao;

import com.example.Java_spring_task17.models.Post;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
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

    @Transactional
    public List<Post> getWorkersWithouManifacture() {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<Post> criteriaQuery = builder.createQuery(Post.class);
        Root<Post> root = criteriaQuery.from(Post.class);
        criteriaQuery.select(root).where(builder.isNull(root.get("user")));

        TypedQuery<Post> query = entityManager.createQuery(criteriaQuery);
        List<Post> posts = query.getResultList();
        return posts;
    }

    @Transactional
    public Post findByText(String text) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<Post> criteriaQuery = builder.createQuery(Post.class);
        Root<Post> root = criteriaQuery.from(Post.class);
        criteriaQuery.select(root).where(builder.equal(root.get("text"), text));

        TypedQuery<Post> query = entityManager.createQuery(criteriaQuery);
        return query.getSingleResult();
    }

    @Transactional
    public List<Post> getWithUser() {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<Post> criteriaQuery = builder.createQuery(Post.class);
        Root<Post> root = criteriaQuery.from(Post.class);
        criteriaQuery.select(root).where(builder.isNotNull(root.get("user")));

        TypedQuery<Post> query = entityManager.createQuery(criteriaQuery);
        List<Post> posts = query.getResultList();
        return posts;
    }

    @Transactional
    public List<Post> greaterThanById(int id) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<Post> criteriaQuery = builder.createQuery(Post.class);
        Root<Post> root = criteriaQuery.from(Post.class);
        criteriaQuery.select(root).where(builder.greaterThan(root.get("id"), id));

        TypedQuery<Post> query = entityManager.createQuery(criteriaQuery);
        List<Post> posts = query.getResultList();
        return posts;
    }
}
