package mirea.ru.prakt6.controller;

import mirea.ru.prakt6.model.WashingMachine;
import mirea.ru.prakt6.service.WashingMachineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/washing-machines")
public class WashingMachineController {

    @Autowired
    private WashingMachineService washingMachineService;

    @GetMapping("/{id}")
    public ResponseEntity<WashingMachine> getWashingMachineById(@PathVariable Long id) {
        WashingMachine washingMachine = washingMachineService.getWashingMachineById(id);
        return ResponseEntity.ok(washingMachine);
    }

    @PostMapping
    public ResponseEntity<WashingMachine> createWashingMachine(@RequestBody WashingMachine washingMachine) {
        WashingMachine createdWashingMachine = washingMachineService.createWashingMachine(washingMachine);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdWashingMachine);
    }

    @PutMapping("/{id}")
    public ResponseEntity<WashingMachine> updateWashingMachine(@PathVariable Long id, @RequestBody WashingMachine washingMachine) {
        WashingMachine updatedWashingMachine = washingMachineService.updateWashingMachine(id, washingMachine);
        return ResponseEntity.ok(updatedWashingMachine);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteWashingMachine(@PathVariable Long id) {
        washingMachineService.deleteWashingMachine(id);
        return ResponseEntity.noContent().build();
    }
}
