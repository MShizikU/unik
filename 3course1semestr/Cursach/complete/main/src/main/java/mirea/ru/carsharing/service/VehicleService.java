package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.Vehicle;
import mirea.ru.carsharing.repos.VehicleRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleService {
    private final VehicleRepo vehicleRepository;

    public VehicleService(VehicleRepo vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    public ExecutionResult<Vehicle> createVehicle(Vehicle vehicle) {
        Optional<Vehicle> existingVehicle = vehicleRepository.findByVin(vehicle.getVin());
        if (existingVehicle.isPresent()) {
            return ExecutionResult.error("Vehicle with the same VIN already exists");
        }
        try {
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
}
