package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.Vehicle;
import mirea.ru.carsharing.service.VehicleService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/vehicle")
public class VehicleController {
    private final VehicleService vehicleService;

    public VehicleController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<Vehicle>> createVehicle(@RequestBody Vehicle vehicle) {
        ExecutionResult<Vehicle> result = vehicleService.createVehicle(vehicle);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        }
        return ResponseEntity.ok(result);
    }

    @PutMapping("/{vin}")
    public ResponseEntity<ExecutionResult<Vehicle>> updateVehicle(@PathVariable String vin, @RequestBody Vehicle updatedVehicle) {
        ExecutionResult<Vehicle> result = vehicleService.updateVehicle(vin, updatedVehicle);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        }
        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/{vin}")
    public ResponseEntity<ExecutionResult<Void>> deleteVehicle(@PathVariable String vin) {
        ExecutionResult<Void> result = vehicleService.deleteVehicle(vin);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{vin}")
    public ResponseEntity<ExecutionResult<Vehicle>> getVehicleById(@PathVariable String vin) {
        ExecutionResult<Vehicle> result = vehicleService.getVehicleById(vin);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<Vehicle>>> getAllVehicles() {
        ExecutionResult<List<Vehicle>> result = vehicleService.getAllVehicles();
        return ResponseEntity.ok(result);
    }
}
