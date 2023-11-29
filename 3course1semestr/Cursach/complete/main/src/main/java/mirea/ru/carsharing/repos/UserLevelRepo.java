package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.UserLevel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserLevelRepo extends JpaRepository<UserLevel, Integer> {
    Optional<UserLevel> findByLevelName(String levelName);
}
