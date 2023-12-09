package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.VehicleGroup;
import mirea.ru.carsharing.repos.VehicleGroupRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleGroupService {

    private final VehicleGroupRepo vehicleGroupRepository;

    @Autowired
    public VehicleGroupService(VehicleGroupRepo vehicleGroupRepository) {
        this.vehicleGroupRepository = vehicleGroupRepository;
    }

    public ExecutionResult<VehicleGroup> createVehicleGroup(VehicleGroup vehicleGroup) {
        Optional<VehicleGroup> existingGroup = vehicleGroupRepository.findByGroupName(vehicleGroup.getGroupName());
        if (existingGroup.isPresent()) {
            return ExecutionResult.error("A vehicle group with the same name already exists.");
        }
        try{
            VehicleGroup createdGroup = vehicleGroupRepository.save(vehicleGroup);
            return ExecutionResult.success(createdGroup);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to create vehicle group: " + ex.getMessage());
        }
    }

    public ExecutionResult<VehicleGroup> updateVehicleGroup(Integer id, VehicleGroup updatedGroup) {
        Optional<VehicleGroup> existingGroup = vehicleGroupRepository.findById(id);
        if (existingGroup.isEmpty()) {
            return ExecutionResult.error("Vehicle group not found.");
        }
        try {
            VehicleGroup groupToUpdate = existingGroup.get();

            if (updatedGroup.getGroupName() != null) {
                groupToUpdate.setGroupName(updatedGroup.getGroupName());
            }
            if (updatedGroup.getGroupDescription() != null) {
                groupToUpdate.setGroupDescription(updatedGroup.getGroupDescription());
            }

            VehicleGroup updatedGroupEntity = vehicleGroupRepository.save(groupToUpdate);
            return ExecutionResult.success(updatedGroupEntity);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to update Vehicle Group: " + ex.getMessage());
        }
    }

    public ExecutionResult<Void> deleteVehicleGroup(Integer id) {
        Optional<VehicleGroup> existingGroup = vehicleGroupRepository.findById(id);
        if (existingGroup.isEmpty()) {
            return ExecutionResult.error("Vehicle group not found.");
        }

        vehicleGroupRepository.deleteById(id);
        return ExecutionResult.success(null);
    }

    public ExecutionResult<VehicleGroup> getVehicleGroupById(Integer id) {
        Optional<VehicleGroup> vehicleGroup = vehicleGroupRepository.findById(id);
        if (vehicleGroup.isEmpty()) {
            return ExecutionResult.error("Vehicle group not found.");
        }

        return ExecutionResult.success(vehicleGroup.get());
    }

    public ExecutionResult<List<VehicleGroup>> getAllVehicleGroups() {
        List<VehicleGroup> vehicleGroups = vehicleGroupRepository.findAll();
        return ExecutionResult.success(vehicleGroups);
    }
}
