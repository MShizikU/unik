package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.VehicleGroup;
import mirea.ru.carsharing.service.VehicleGroupService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("api/vehicle/groups")
public class VehicleGroupController {

    private final VehicleGroupService vehicleGroupService;

    @Autowired
    public VehicleGroupController(VehicleGroupService vehicleGroupService) {
        this.vehicleGroupService = vehicleGroupService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<VehicleGroup>> createVehicleGroup(@RequestBody VehicleGroup vehicleGroup) {
        ExecutionResult<VehicleGroup> result = vehicleGroupService.createVehicleGroup(vehicleGroup);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleGroup>> updateVehicleGroup(
            @PathVariable("id") Integer id, @RequestBody VehicleGroup vehicleGroup) {
        ExecutionResult<VehicleGroup> result = vehicleGroupService.updateVehicleGroup(id, vehicleGroup);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ExecutionResult<Void>> deleteVehicleGroup(@PathVariable("id") Integer id) {
        ExecutionResult<Void> result = vehicleGroupService.deleteVehicleGroup(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleGroup>> getVehicleGroupById(@PathVariable("id") Integer id) {
        ExecutionResult<VehicleGroup> result = vehicleGroupService.getVehicleGroupById(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<VehicleGroup>>> getAllVehicleGroups() {
        ExecutionResult<List<VehicleGroup>> result = vehicleGroupService.getAllVehicleGroups();
        if (result.getErrorMessage() != null) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }
}
