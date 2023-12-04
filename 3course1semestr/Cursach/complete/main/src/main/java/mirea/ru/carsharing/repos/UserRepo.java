package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.UserLevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    List<User> findByIdLevel(Integer idLevel);

    Optional<User> findByUsername(String username);

    Optional<User> findBySnpassport(Long snpassport);
}
