package ru.mirea.Prakt15.Services;

import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;
import ru.mirea.Prakt15.tables.Post;

import java.util.List;

@Service
public class PostService implements TableService<Post> {

    private final SessionFactory sessionFactory;
    private Session session;

    public PostService(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void createEntity(Post post) {
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(post);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Post> readAllEntity() {
        session = sessionFactory.openSession();
        List<Post> posts = session.createQuery("select i from Posts i", Post.class).getResultList();
        session.close();
        return posts;
    }

    @Override
    public Post readOneEntity(long id) {
        session = sessionFactory.openSession();
        Post posts = session.createQuery("from Post where id = :id", Post.class).setParameter("id", id).getSingleResult();
        session.close();
        return posts;
    }

    @Override
    public boolean updateEntity(Post post, long id) {
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query q = session.createQuery("update Groups set creation_date=:n where id = :id")
                .setParameter("id", id)
                .setParameter("n", post.getCreationDate());
        int status = q.executeUpdate();
        System.out.println(status);
        transaction.commit();
        session.close();
        return true;
    }

    @Override
    public boolean deleteEntity(long id) {
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query q = session.createQuery("delete from Posts where id = :id")
                .setParameter("id", id);
        int status = q.executeUpdate();
        System.out.println(status);
        transaction.commit();
        session.close();
        return true;
    }
}
