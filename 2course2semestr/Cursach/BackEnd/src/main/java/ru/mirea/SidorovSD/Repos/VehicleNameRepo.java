package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Vehicle_name;

import java.util.List;

public interface VehicleNameRepo extends JpaRepository<Vehicle_name, Integer> {

    Vehicle_name findByIdBrandAndIdModel(int idBrand, int idModel);

    Vehicle_name findByIdVehicleName(int idVehicleName);


    List<Vehicle_name> findByIdBrand(int brandId);

    List<Vehicle_name> findByIdModel(int modelId);

}
