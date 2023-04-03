package ru.mirea.Prakt15.Services;

import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;
import ru.mirea.Prakt15.tables.User;

import java.util.List;

@Service
public class UserService implements TableService<User> {
    private final SessionFactory sessionFactory;
    private Session session;

    public UserService(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void createEntity(User user) {
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(user);
        transaction.commit();
        session.close();
    }

    @Override
    public List<User> readAllEntity() {
        session = sessionFactory.openSession();
        List<User> students = session.createQuery("select i from Users i", User.class).getResultList();
        session.close();
        return students;
    }

    @Override
    public User readOneEntity(long id) {
        session = sessionFactory.openSession();
        User user = null;
        try {
            user = session.createQuery("from Users where id = :id", User.class)
                    .setParameter("id", id).getSingleResult();
        } catch (NoResultException noResultException) {

        }
        System.out.println(user);
        session.close();
        return user;
    }

    @Override
    public boolean updateEntity(User user, long id) {
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query q = session.createQuery("update Student set firstName=:n, lastName=:y, middleName=:z where id = :id, birth_date=:d")
                .setParameter("id", id)
                .setParameter("n", user.getFirstName())
                .setParameter("y", user.getLastName())
                .setParameter("z", user.getMiddleName())
                .setParameter("d", user.getBirthDate());
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
        Query q = session.createQuery("delete from User where id = :id")
                .setParameter("id", id);
        int status = q.executeUpdate();
        System.out.println(status);
        transaction.commit();
        session.close();
        return true;
    }
}
