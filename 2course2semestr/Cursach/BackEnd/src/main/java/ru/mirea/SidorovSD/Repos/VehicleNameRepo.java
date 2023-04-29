package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle_name;

import java.util.List;

public interface VehicleNameRepo extends JpaRepository<Vehicle_name, Integer> {

    List<Vehicle_name> findByPricePerHour(int pricePerHour);

    Vehicle_name findByIdVehicleName(int idVehicleName);

}
