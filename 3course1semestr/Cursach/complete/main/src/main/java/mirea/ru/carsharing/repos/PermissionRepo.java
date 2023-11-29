package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Permission;
import mirea.ru.carsharing.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionRepo extends JpaRepository<Permission, Integer> {
}
