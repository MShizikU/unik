package mirea.ru.carsharing.repos;

import mirea.ru.carsharing.model.VehicleName;
import mirea.ru.carsharing.model.VehicleWorkModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleWorkModelRepo extends JpaRepository<VehicleWorkModel, Integer> {
    boolean existsByPricePerHourAndIdVehicleName(Float pricePerHour, Integer idVehicleName);
}
