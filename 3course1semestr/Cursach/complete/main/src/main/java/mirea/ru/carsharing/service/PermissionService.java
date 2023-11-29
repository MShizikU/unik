package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.Permission;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.model.VehicleGroup;
import mirea.ru.carsharing.repos.PermissionRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PermissionService {
    private final PermissionRepo permissionRepository;

    public PermissionService(PermissionRepo permissionRepository) {
        this.permissionRepository = permissionRepository;
    }

    public ExecutionResult<Permission> createPermission(Permission permission) {
        boolean exists = permissionRepository.existsByIdUserLevelAndIdVehicleGroup(
                permission.getUserLevel().getIdLevel(), permission.getVehicleGroup().getIdGroup());

        if (exists) {
            return ExecutionResult.error("Permission with the same parameters already exists.");
        }

        Permission createdPermission = permissionRepository.save(permission);
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
