package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleGroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleGroupRepo extends JpaRepository<VehicleGroup, Integer> {
}
