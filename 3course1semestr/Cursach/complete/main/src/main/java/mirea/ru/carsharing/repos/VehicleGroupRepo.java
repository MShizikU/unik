package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleGroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VehicleGroupRepo extends JpaRepository<VehicleGroup, Integer> {
    Optional<VehicleGroup> findByGroupName(String groupName);
}
