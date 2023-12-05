package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.Vehicle;
import mirea.ru.carsharing.model.VehicleWorkModel;
import mirea.ru.carsharing.repos.VehicleRepo;
import mirea.ru.carsharing.repos.VehicleWorkModelRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleService {

    @Autowired
    private VehicleRepo vehicleRepository;

    @Autowired
    private VehicleWorkModelRepo vehicleWorkModelRepo;


    public ExecutionResult<Vehicle> createVehicle(Vehicle vehicle) {
        Optional<Vehicle> existingVehicle = vehicleRepository.findByVin(vehicle.getVin());
        if (existingVehicle.isPresent()) {
            return ExecutionResult.error("Vehicle with the same VIN already exists");
        }

        Optional<VehicleWorkModel> vehicleWorkModel = vehicleWorkModelRepo.findById(vehicle.getIdVehicleWorkModel());
        if (vehicleWorkModel.isEmpty())
            return ExecutionResult.error("Unable to find vehicle work model with such id");

        try {
            vehicle.setState("available");
            Vehicle savedVehicle = vehicleRepository.save(vehicle);
            return ExecutionResult.success(savedVehicle);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to create Vehicle: " + ex.getMessage());
        }
    }

    public ExecutionResult<Vehicle> updateVehicle(String vin, Vehicle updatedVehicle) {
        Optional<Vehicle> existingVehicle = vehicleRepository.findByVin(vin);
        if (existingVehicle.isEmpty()) {
            return ExecutionResult.error("Vehicle not found");
        }
        try {
            Vehicle vehicleToUpdate = existingVehicle.get();
            if (updatedVehicle.getColor() != null) {
                vehicleToUpdate.setColor(updatedVehicle.getColor());
            }
            if (updatedVehicle.getState() != null) {
                vehicleToUpdate.setState(updatedVehicle.getState());
            }
            if (updatedVehicle.getPlace() != null) {
                vehicleToUpdate.setPlace(updatedVehicle.getPlace());
            }

            if (updatedVehicle.getIdVehicleWorkModel() != null){
                Optional<VehicleWorkModel> vehicleWorkModel = vehicleWorkModelRepo.findById(updatedVehicle.getIdVehicleWorkModel());
                if (vehicleWorkModel.isEmpty())
                    return ExecutionResult.error("Unable to find vehicle work model with such id");
                vehicleToUpdate.setIdVehicleWorkModel(updatedVehicle.getIdVehicleWorkModel());
            }
            Vehicle updated = vehicleRepository.save(vehicleToUpdate);
            return ExecutionResult.success(updated);
        }
        catch (Exception exception){
            return ExecutionResult.error("Unable to update Vehicle: " + exception.getMessage());
        }
    }

    public ExecutionResult<Void> deleteVehicle(String vin) {
        Optional<Vehicle> existingVehicle = vehicleRepository.findByVin(vin);
        if (existingVehicle.isEmpty()) {
            return ExecutionResult.error("Vehicle not found");
        }
        vehicleRepository.delete(existingVehicle.get());
        return ExecutionResult.success(null);
    }

    public ExecutionResult<Vehicle> getVehicleById(String vin) {
        Optional<Vehicle> existingVehicle = vehicleRepository.findByVin(vin);
        if (existingVehicle.isEmpty()) {
            return ExecutionResult.error("Vehicle not found");
        }
        return ExecutionResult.success(existingVehicle.get());
    }

    public ExecutionResult<List<Vehicle>> getAllVehicles() {
        List<Vehicle> vehicles = vehicleRepository.findAll();
        return ExecutionResult.success(vehicles);
    }

    public ExecutionResult<List<Vehicle>> getVehicleByWorkModel(Integer idWorkModel){
        return ExecutionResult.success(vehicleRepository.findVehiclesByIdVehicleWorkModel(idWorkModel));
    }
}
