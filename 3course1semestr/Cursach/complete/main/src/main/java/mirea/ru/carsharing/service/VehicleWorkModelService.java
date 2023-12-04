package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.VehicleName;
import mirea.ru.carsharing.model.VehicleWorkModel;
import mirea.ru.carsharing.repos.VehicleWorkModelRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleWorkModelService {
    private final VehicleWorkModelRepo vehicleWorkModelRepository;

    public VehicleWorkModelService(VehicleWorkModelRepo vehicleWorkModelRepository) {
        this.vehicleWorkModelRepository = vehicleWorkModelRepository;
    }

    public ExecutionResult<VehicleWorkModel> createVehicleWorkModel(VehicleWorkModel vehicleWorkModel) {
        Float pricePerHour = vehicleWorkModel.getPricePerHour();

        if (vehicleWorkModelRepository.existsByPricePerHourAndIdVehicleName(pricePerHour, vehicleWorkModel.getIdVehicleName())) {
            return ExecutionResult.error("Vehicle work model with the same price per hour and vehicle name already exists.");
        }

        VehicleWorkModel savedVehicleWorkModel = vehicleWorkModelRepository.save(vehicleWorkModel);
        return ExecutionResult.success(savedVehicleWorkModel);
    }

    public ExecutionResult<VehicleWorkModel> updateVehicleWorkModel(Integer id, VehicleWorkModel updatedModel) {
        VehicleWorkModel existingModel = vehicleWorkModelRepository.findById(id).orElse(null);
        if (existingModel == null) {
            return ExecutionResult.error("VehicleWorkModel not found");
        }

        try{
            if (updatedModel.getPricePerHour() != null) {
                existingModel.setPricePerHour(updatedModel.getPricePerHour());
            }
            if (updatedModel.getIdVehicleName() != null) {
                existingModel.setIdVehicleName(updatedModel.getIdVehicleName());
            }
            if (updatedModel.getModelPhotoName() != null) {
                existingModel.setModelPhotoName(updatedModel.getModelPhotoName());
            }
            if (updatedModel.getVehicleGroup() != null) {
                existingModel.setVehicleGroup(updatedModel.getVehicleGroup());
            }

            VehicleWorkModel updatedVehicleWorkModel = vehicleWorkModelRepository.save(existingModel);
            return ExecutionResult.success(updatedVehicleWorkModel);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to update vehicle work model: " + ex.getMessage());
        }
    }

    public ExecutionResult<VehicleWorkModel> getVehicleWorkModelById(Integer id) {
        Optional<VehicleWorkModel> optionalVehicleWorkModel = vehicleWorkModelRepository.findById(id);
        if (optionalVehicleWorkModel.isPresent()) {
            VehicleWorkModel vehicleWorkModel = optionalVehicleWorkModel.get();
            return ExecutionResult.success(vehicleWorkModel);
        } else {
            return ExecutionResult.error("Vehicle work model with the given ID does not exist.");
        }
    }

    public ExecutionResult<List<VehicleWorkModel>> getAllVehicleWorkModels() {
        List<VehicleWorkModel> vehicleWorkModels = vehicleWorkModelRepository.findAll();
        return ExecutionResult.success(vehicleWorkModels);
    }

    public ExecutionResult<Void> deleteVehicleWorkModel(Integer id) {
        if (vehicleWorkModelRepository.existsById(id)) {
            vehicleWorkModelRepository.deleteById(id);
            return ExecutionResult.success(null);
        } else {
            return ExecutionResult.error("Vehicle work model with the given ID does not exist.");
        }
    }
}
