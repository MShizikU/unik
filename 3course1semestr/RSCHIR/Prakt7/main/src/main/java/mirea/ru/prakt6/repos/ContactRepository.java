package mirea.ru.prakt6.repos;

import jdk.jfr.Registered;
import mirea.ru.prakt6.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Long> {
}
