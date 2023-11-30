package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.VehicleModel;
import mirea.ru.carsharing.repos.VehicleModelRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleModelService {
    private final VehicleModelRepo vehicleModelRepository;

    public VehicleModelService(VehicleModelRepo vehicleModelRepository) {
        this.vehicleModelRepository = vehicleModelRepository;
    }

    public ExecutionResult<VehicleModel> createVehicleModel(VehicleModel vehicleModel) {
        Optional<VehicleModel> existingModel = vehicleModelRepository.findByModelNameAndCYear(vehicleModel.getModelName(), vehicleModel.getCYear());
        if (existingModel.isPresent()) {
            return ExecutionResult.error("Vehicle model with the same params already exists");
        }
        VehicleModel savedModel = vehicleModelRepository.save(vehicleModel);
        return ExecutionResult.success(savedModel);
    }

    public ExecutionResult<VehicleModel> getVehicleModelById(Integer id) {
        Optional<VehicleModel> vehicleModel = vehicleModelRepository.findById(id);
        if (vehicleModel.isPresent()) {
            return ExecutionResult.success(vehicleModel.get());
        } else {
            return ExecutionResult.error("Vehicle model not found");
        }
    }

    public ExecutionResult<List<VehicleModel>> getAllVehicleModels() {
        List<VehicleModel> vehicleModels = vehicleModelRepository.findAll();
        return ExecutionResult.success(vehicleModels);
    }

    public ExecutionResult<Void> deleteVehicleModel(Integer id) {
        Optional<VehicleModel> vehicleModel = vehicleModelRepository.findById(id);
        if (vehicleModel.isPresent()) {
            vehicleModelRepository.delete(vehicleModel.get());
            return ExecutionResult.success(null);
        } else {
            return ExecutionResult.error("Vehicle model not found");
        }
    }
}
