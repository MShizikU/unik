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
        Integer vehicleModelId = vehicleName.getVehicleModel().getIdModel();
        VehicleModel vehicleModel = vehicleModelRepository.findById(vehicleModelId).orElse(null);
        if (vehicleModel == null)
            return ExecutionResult.error("VehicleModel not found");

        Integer vehicleBrandId = vehicleName.getVehicleBrand().getIdBrand();
        VehicleBrand vehicleBrand = vehicleBrandRepository.findById(vehicleBrandId).orElse(null);
        if (vehicleBrand == null)
            return ExecutionResult.error("VehicleBrand not found");

        VehicleName savedVehicleName = vehicleNameRepository.save(vehicleName);
        return ExecutionResult.success(savedVehicleName);
    }

    public ExecutionResult<VehicleName> updateVehicleName(Integer id, VehicleName updatedName) {
        VehicleName existingName = vehicleNameRepository.findById(id).orElse(null);
        if (existingName == null) {
            return ExecutionResult.error("VehicleName not found");
        }
        if (updatedName.getVehicleModel() != null) {
            Integer vehicleModelId = updatedName.getVehicleModel().getIdModel();
            VehicleModel vehicleModel = vehicleModelRepository.findById(vehicleModelId).orElse(null);
            if (vehicleModel == null) {
                return ExecutionResult.error("VehicleModel not found");
            }
            existingName.setVehicleModel(vehicleModel);
        }

        if (updatedName.getVehicleBrand() != null) {
            Integer vehicleBrandId = updatedName.getVehicleBrand().getIdBrand();
            VehicleBrand vehicleBrand = vehicleBrandRepository.findById(vehicleBrandId).orElse(null);
            if (vehicleBrand == null) {
                return ExecutionResult.error("VehicleBrand not found");
            }
            existingName.setVehicleBrand(vehicleBrand);
        }

        VehicleName updatedVehicleName = vehicleNameRepository.save(existingName);
        return ExecutionResult.success(updatedVehicleName);
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
