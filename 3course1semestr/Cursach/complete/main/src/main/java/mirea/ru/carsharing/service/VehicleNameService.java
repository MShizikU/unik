package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.VehicleBrand;
import mirea.ru.carsharing.model.VehicleModel;
import mirea.ru.carsharing.model.VehicleName;
import mirea.ru.carsharing.repos.VehicleBrandRepo;
import mirea.ru.carsharing.repos.VehicleModelRepo;
import mirea.ru.carsharing.repos.VehicleNameRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleNameService {
    @Autowired
    private VehicleNameRepo vehicleNameRepository;

    @Autowired
    private VehicleModelRepo vehicleModelRepository;

    @Autowired
    private VehicleBrandRepo vehicleBrandRepository;

    public ExecutionResult<VehicleName> create(VehicleName vehicleName) {
        Optional<VehicleName> existingVehicleName = vehicleNameRepository.findByVehicleModelAndVehicleBrand(vehicleName.getVehicleModel(), vehicleName.getVehicleBrand());
        if (existingVehicleName.isPresent()) {
            return ExecutionResult.error("VehicleName with the same params already exists");
        }
        try{
            VehicleName savedVehicleName = vehicleNameRepository.save(vehicleName);
            return ExecutionResult.success(savedVehicleName);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to create vehicle name: "  +ex.getMessage());
        }
    }

    public ExecutionResult<VehicleName> updateVehicleName(Integer id, VehicleName updatedName) {
        VehicleName existingName = vehicleNameRepository.findById(id).orElse(null);
        if (existingName == null) {
            return ExecutionResult.error("VehicleName not found");
        }
        try{
            if (updatedName.getVehicleModel() != null) {
                existingName.setVehicleModel(updatedName.getVehicleModel());
            }
            if (updatedName.getVehicleBrand() != null) {
                existingName.setVehicleBrand(updatedName.getVehicleBrand());
            }
            VehicleName updatedVehicleName = vehicleNameRepository.save(existingName);
            return ExecutionResult.success(updatedVehicleName);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to update vehicle name:" + ex.getMessage());
        }
    }

    public ExecutionResult<Void> delete(Integer id) {
        vehicleNameRepository.deleteById(id);
        return ExecutionResult.success(null);
    }

    public ExecutionResult<VehicleName> getById(Integer id) {
        Optional<VehicleName> vehicleName = vehicleNameRepository.findById(id);
        if (vehicleName.isPresent()) {
            return ExecutionResult.success(vehicleName.get());
        } else {
            return ExecutionResult.error("VehicleName not found");
        }
    }

    public ExecutionResult<List<VehicleName>> getAll() {
        List<VehicleName> vehicleNames = vehicleNameRepository.findAll();
        return ExecutionResult.success(vehicleNames);
    }
}
