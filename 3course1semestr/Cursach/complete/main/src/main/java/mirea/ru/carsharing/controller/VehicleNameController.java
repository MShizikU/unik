package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.VehicleName;
import mirea.ru.carsharing.service.VehicleNameService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/vehicle/names")
public class VehicleNameController {
    private final VehicleNameService vehicleNameService;

    public VehicleNameController(VehicleNameService vehicleNameService) {
        this.vehicleNameService = vehicleNameService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<VehicleName>> create(@RequestBody VehicleName vehicleName) {
        ExecutionResult<VehicleName> result = vehicleNameService.create(vehicleName);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        }
        return ResponseEntity.ok(result);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleName>> updateVehicleName(@PathVariable Integer id, @RequestBody VehicleName vehicleName) {
        vehicleName.setIdVehicleName(id);
        ExecutionResult<VehicleName> result = vehicleNameService.updateVehicleName(id, vehicleName);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ExecutionResult<Void>> delete(@PathVariable Integer id) {
        ExecutionResult<Void> result = vehicleNameService.delete(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleName>> getById(@PathVariable Integer id) {
        ExecutionResult<VehicleName> result = vehicleNameService.getById(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<VehicleName>>> getAll() {
        ExecutionResult<List<VehicleName>> result = vehicleNameService.getAll();
        return ResponseEntity.ok(result);
    }
}
