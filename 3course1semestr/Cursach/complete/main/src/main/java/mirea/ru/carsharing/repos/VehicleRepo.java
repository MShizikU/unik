package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleRepo extends JpaRepository<Vehicle, Integer> {
}
