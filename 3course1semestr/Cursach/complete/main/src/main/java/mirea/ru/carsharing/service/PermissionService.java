package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.Permission;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.model.VehicleGroup;
import mirea.ru.carsharing.repos.PermissionRepo;
import mirea.ru.carsharing.repos.UserLevelRepo;
import mirea.ru.carsharing.repos.VehicleGroupRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PermissionService {

    @Autowired
    private  PermissionRepo permissionRepository;

    @Autowired
    private UserLevelRepo userLevelRepository;

    @Autowired
    private VehicleGroupRepo vehicleGroupRepository;

    public ExecutionResult<Permission> createPermission(Permission newPermission) {
        UserLevel userLevel = userLevelRepository.findById(newPermission.getUserLevel().getIdLevel()).orElse(null);
        if (userLevel == null) {
            return ExecutionResult.error("User level not found");
        }
        VehicleGroup vehicleGroup = vehicleGroupRepository.findById(newPermission.getVehicleGroup().getIdGroup()).orElse(null);
        if (vehicleGroup == null) {
            return ExecutionResult.error("Vehicle group not found");
        }

        newPermission.setUserLevel(userLevel);
        newPermission.setVehicleGroup(vehicleGroup);

        Permission createdPermission = permissionRepository.save(newPermission);
        return ExecutionResult.success(createdPermission);
    }

    public ExecutionResult<Permission> deletePermission(UserLevel userLevel, VehicleGroup vehicleGroup) {
        Optional<Permission> optionalPermission = permissionRepository.findByIdUserLevelAndIdVehicleGroup(
                userLevel.getIdLevel(), vehicleGroup.getIdGroup());

        if (optionalPermission.isEmpty()) {
            return ExecutionResult.error("Permission not found.");
        }

        Permission permission = optionalPermission.get();
        permissionRepository.delete(permission);
        return ExecutionResult.success(permission);
    }

    public ExecutionResult<Permission> getPermission(UserLevel userLevel, VehicleGroup vehicleGroup) {
        Optional<Permission> optionalPermission = permissionRepository.findByIdUserLevelAndIdVehicleGroup(
                userLevel.getIdLevel(), vehicleGroup.getIdGroup());

        if (optionalPermission.isEmpty()) {
            return ExecutionResult.error("Permission not found.");
        }

        Permission permission = optionalPermission.get();
        return ExecutionResult.success(permission);
    }

    public ExecutionResult<Permission> getPermission(Integer userLevel, Integer vehicleGroup) {
        Optional<Permission> optionalPermission = permissionRepository.findByIdUserLevelAndIdVehicleGroup(
                userLevel, vehicleGroup);

        if (optionalPermission.isEmpty()) {
            return ExecutionResult.error("Permission not found.");
        }

        Permission permission = optionalPermission.get();
        return ExecutionResult.success(permission);
    }

    public ExecutionResult<List<Permission>> getAllPermissions() {
        List<Permission> permissions = permissionRepository.findAll();
        return ExecutionResult.success(permissions);
    }
}
