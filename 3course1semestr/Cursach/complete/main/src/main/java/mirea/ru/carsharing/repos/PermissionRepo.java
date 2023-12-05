package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PermissionRepo extends JpaRepository<Permission, Integer> {
    boolean existsByIdLevelAndIdGroup(Integer userLevel, Integer vehicleGroup);
    Optional<Permission> findByIdLevelAndIdGroup(Integer idLevel, Integer idGroup);

    List<Permission> findPermissionsByIdLevel(Integer idLevel);
    List<Permission> findPermissionsByIdGroup(Integer idGroup);
}
