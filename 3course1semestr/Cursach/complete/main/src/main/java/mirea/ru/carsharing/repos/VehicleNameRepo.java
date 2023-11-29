package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleName;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleNameRepo extends JpaRepository<VehicleName, Integer> {
}
