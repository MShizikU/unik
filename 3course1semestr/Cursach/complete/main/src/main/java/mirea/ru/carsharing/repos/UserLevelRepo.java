package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.UserLevel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLevelRepo extends JpaRepository<UserLevel, Integer> {
}
