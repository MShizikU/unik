package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle;

import java.util.List;

public interface VehicleRepo extends JpaRepository<Vehicle, Integer> {

    Vehicle findByVin(String vin);

    List<Vehicle> findByIdVehicleWorkModel(int idVehicleWorkModel);

}
