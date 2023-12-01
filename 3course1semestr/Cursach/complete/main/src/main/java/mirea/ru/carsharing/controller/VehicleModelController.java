package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.VehicleModel;
import mirea.ru.carsharing.service.VehicleModelService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/vehicle/models")
public class VehicleModelController {
    private final VehicleModelService vehicleModelService;

    public VehicleModelController(VehicleModelService vehicleModelService) {
        this.vehicleModelService = vehicleModelService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<VehicleModel>> createVehicleModel(@RequestBody VehicleModel vehicleModel) {
        ExecutionResult<VehicleModel> result = vehicleModelService.createVehicleModel(vehicleModel);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleModel>> updateVehicleModel(@PathVariable Integer id, @RequestBody VehicleModel vehicleModel){
        ExecutionResult<VehicleModel> result = vehicleModelService.updateVehicleModel(id, vehicleModel);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleModel>> getVehicleModelById(@PathVariable Integer id) {
        ExecutionResult<VehicleModel> result = vehicleModelService.getVehicleModelById(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<VehicleModel>>> getAllVehicleModels() {
        ExecutionResult<List<VehicleModel>> result = vehicleModelService.getAllVehicleModels();
        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ExecutionResult<Void>> deleteVehicleModel(@PathVariable Integer id) {
        ExecutionResult<Void> result = vehicleModelService.deleteVehicleModel(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(result);
        }
    }
}
