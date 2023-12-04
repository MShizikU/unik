package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleBrand;
import mirea.ru.carsharing.model.VehicleModel;
import mirea.ru.carsharing.model.VehicleName;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VehicleNameRepo extends JpaRepository<VehicleName, Integer> {
    Optional<VehicleName> findByIdModelAndIdBrand(Integer idModel, Integer idBrand);
}
