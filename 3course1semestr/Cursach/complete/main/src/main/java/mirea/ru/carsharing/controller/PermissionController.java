package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.Permission;
import mirea.ru.carsharing.model.UserLevel;
import mirea.ru.carsharing.model.VehicleGroup;
import mirea.ru.carsharing.service.PermissionService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/permissions")
public class PermissionController {
    private final PermissionService permissionService;

    public PermissionController(PermissionService permissionService) {
        this.permissionService = permissionService;
    }


    @PostMapping
    public ResponseEntity<ExecutionResult<Permission>> createPermission(@RequestBody Permission permission) {
        ExecutionResult<Permission> result = permissionService.createPermission(permission);
        HttpStatus status = result.getErrorMessage() == null ? HttpStatus.CREATED : HttpStatus.BAD_REQUEST;
        return new ResponseEntity<>(result, status);
    }

    @DeleteMapping
    public ResponseEntity<ExecutionResult<Permission>> deletePermission(@RequestBody Permission permission) {
        ExecutionResult<Permission> result = permissionService.deletePermission(
                permission.getIdLevel(), permission.getIdGroup());

        HttpStatus status = result.getErrorMessage() == null ? HttpStatus.OK : HttpStatus.NOT_FOUND;
        return new ResponseEntity<>(result, status);
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<Permission>> getPermission(
            @RequestParam("user_level_id") Integer userLevel,
            @RequestParam("vehicle_group_id") Integer vehicleGroup) {
        ExecutionResult<Permission> result = permissionService.getPermission(userLevel, vehicleGroup);
        HttpStatus status = result.getErrorMessage() == null ? HttpStatus.OK : HttpStatus.NOT_FOUND;
        return new ResponseEntity<>(result, status);
    }

    @GetMapping("/all")
    public ResponseEntity<ExecutionResult<List<Permission>>> getAllPermissions() {
        ExecutionResult<List<Permission>> result = permissionService.getAllPermissions();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}