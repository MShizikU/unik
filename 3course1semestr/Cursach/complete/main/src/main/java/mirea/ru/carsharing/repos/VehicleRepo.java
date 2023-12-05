package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface VehicleRepo extends JpaRepository<Vehicle, Integer> {
    Optional<Vehicle> findByVin(String vin);
    List<Vehicle> findVehiclesByIdVehicleWorkModel(Integer idVehicleWorkModel);
}
