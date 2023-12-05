package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleName;
import mirea.ru.carsharing.model.VehicleWorkModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VehicleWorkModelRepo extends JpaRepository<VehicleWorkModel, Integer> {
    boolean existsByPricePerHourAndIdVehicleName(Float pricePerHour, Integer idVehicleName);
    List<VehicleWorkModel> findVehicleWorkModelsByIdVehicleGroup(Integer idVehicleGroup);
}
