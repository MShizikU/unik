package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.model.Rent;
import mirea.ru.carsharing.service.RentService;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/rents")
public class RentController {

    private final RentService rentService;

    public RentController(RentService rentService) {
        this.rentService = rentService;
    }

    @PostMapping
    public ResponseEntity<ExecutionResult<Rent>> createRent(@RequestBody Rent rent) {
        ExecutionResult<Rent> result = rentService.createRent(rent);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        }

        return ResponseEntity.ok(result);
    }

    @PutMapping("/{rentId}")
    public ResponseEntity<ExecutionResult<Rent>> updateRent(@PathVariable Integer rentId, @RequestBody Rent rent) {
        ExecutionResult<Rent> result = rentService.updateRent(rentId, rent);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.badRequest().body(result);
        }

        return ResponseEntity.ok(result);
    }

    @DeleteMapping("/{rentId}")
    public ResponseEntity<Void> deleteRent(@PathVariable Integer rentId) {
        ExecutionResult<Rent> result = rentService.deleteRent(rentId);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<ExecutionResult<List<Rent>>> getAllRents() {
        return ResponseEntity.ok(rentService.getAllRents());
    }

    @GetMapping("/{rentId}")
    public ResponseEntity<ExecutionResult<Rent>> getRentById(@PathVariable Integer rentId) {
        ExecutionResult<Rent> result = rentService.getRentById(rentId);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(result);
    }

    @GetMapping(params = "snpassport")
    public ResponseEntity<ExecutionResult<Rent>> getRentBySnpassport(@RequestParam String snpassport) {
        ExecutionResult<Rent> result = rentService.getRentBySnpassport(snpassport);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(result);
    }

    @GetMapping(params = "vin")
    public ResponseEntity<ExecutionResult<Rent>> getRentByVin(@RequestParam String vin) {
        ExecutionResult<Rent> result = rentService.getRentByVin(vin);
        if (result.getErrorMessage() != null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(result);
    }
}