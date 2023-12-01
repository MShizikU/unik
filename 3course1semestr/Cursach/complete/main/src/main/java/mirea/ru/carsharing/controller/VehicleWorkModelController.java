package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.VehicleWorkModel;
import mirea.ru.carsharing.service.VehicleWorkModelService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/vehicle/work_models")
public class VehicleWorkModelController {
    private final VehicleWorkModelService vehicleWorkModelService;

    public VehicleWorkModelController(VehicleWorkModelService vehicleWorkModelService) {
        this.vehicleWorkModelService = vehicleWorkModelService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<VehicleWorkModel>> createVehicleWorkModel(@RequestBody VehicleWorkModel vehicleWorkModel) {
        ExecutionResult<VehicleWorkModel> executionResult = vehicleWorkModelService.createVehicleWorkModel(vehicleWorkModel);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(executionResult);
        } else {
            return ResponseEntity.ok(executionResult);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleWorkModel>> updateVehicleWorkModel(@PathVariable Integer id, @RequestBody VehicleWorkModel updatedModel) {
        ExecutionResult<VehicleWorkModel> result = vehicleWorkModelService.updateVehicleWorkModel(id, updatedModel);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleWorkModel>> getVehicleWorkModelById(@PathVariable Integer id) {
        ExecutionResult<VehicleWorkModel> executionResult = vehicleWorkModelService.getVehicleWorkModelById(id);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(executionResult);
        }
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<VehicleWorkModel>>> getAllVehicleWorkModels() {
        ExecutionResult<List<VehicleWorkModel>> executionResult = vehicleWorkModelService.getAllVehicleWorkModels();
        return ResponseEntity.ok(executionResult);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ExecutionResult<Void>> deleteVehicleWorkModel(@PathVariable Integer id) {
        ExecutionResult<Void> executionResult = vehicleWorkModelService.deleteVehicleWorkModel(id);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(executionResult);
        }
    }
}
