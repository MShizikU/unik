package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.VehicleBrand;
import mirea.ru.carsharing.service.VehicleBrandService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/vehicle/brands")
public class VehicleBrandController {
    private final VehicleBrandService vehicleBrandService;

    public VehicleBrandController(VehicleBrandService vehicleBrandService) {
        this.vehicleBrandService = vehicleBrandService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<VehicleBrand>> createVehicleBrand(@RequestBody VehicleBrand vehicleBrand) {
        ExecutionResult<VehicleBrand> result = vehicleBrandService.createVehicleBrand(vehicleBrand);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> updateVehicleBrand(@PathVariable Integer id, @RequestBody VehicleBrand updatedBrand) {
        ExecutionResult<VehicleBrand> executionResult = vehicleBrandService.updateVehicleBrand(id, updatedBrand);
        if (executionResult.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(executionResult);
        }
        return ResponseEntity.ok(executionResult.getResult());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExecutionResult<VehicleBrand>> getVehicleBrandById(@PathVariable Integer id) {
        ExecutionResult<VehicleBrand> result = vehicleBrandService.getVehicleBrandById(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(result);
        }
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<VehicleBrand>>> getAllVehicleBrands() {
        ExecutionResult<List<VehicleBrand>> result = vehicleBrandService.getAllVehicleBrands();
        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ExecutionResult<Void>> deleteVehicleBrand(@PathVariable Integer id) {
        ExecutionResult<Void> result = vehicleBrandService.deleteVehicleBrand(id);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(result);
        }
    }
}
