package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VehicleModelRepo extends JpaRepository<VehicleModel, Integer> {
    Optional<VehicleModel> findVehicleModelByCyearAndModelName( String CYear, String modelName);
}
