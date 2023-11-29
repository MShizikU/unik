package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleBrand;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleBrandRepo extends JpaRepository<VehicleBrand, Integer> {
}
