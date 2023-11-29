package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleModelRepo extends JpaRepository<VehicleModel, Integer> {
}
