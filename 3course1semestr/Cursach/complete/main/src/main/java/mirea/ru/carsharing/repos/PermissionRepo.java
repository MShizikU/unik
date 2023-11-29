package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Permission;
import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.model.VehicleGroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PermissionRepo extends JpaRepository<Permission, Integer> {
    boolean existsByIdUserLevelAndIdVehicleGroup(Integer userLevel, Integer vehicleGroup);
    Optional<Permission> findByIdUserLevelAndIdVehicleGroup(Integer userLevel, Integer vehicleGroup);

}
