package mirea.ru.prakt6.repos;

import mirea.ru.prakt6.model.Telephone;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TelephonesRepository extends JpaRepository<Telephone, Long> {
}
