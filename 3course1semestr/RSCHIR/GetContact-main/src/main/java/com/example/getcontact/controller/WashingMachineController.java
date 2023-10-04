package com.example.getcontact.controller;

import com.example.getcontact.entity.WashingMachine;
import com.example.getcontact.repository.WashingMachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/washing-machines")
public class WashingMachineController {
    @Autowired
    private WashingMachineRepository washingMachineRepository;

    @GetMapping("/")
    public List<WashingMachine> getAllWashingMachines() {
        return washingMachineRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<WashingMachine> getWashingMachineById(@PathVariable(value = "id") Long washingMachineId) {
        Optional<WashingMachine> washingMachine = washingMachineRepository.findById(washingMachineId);
        if (washingMachine.isPresent()) {
            return ResponseEntity.ok().body(washingMachine.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/")
    public WashingMachine createWashingMachine(@RequestBody WashingMachine washingMachine) {
        return washingMachineRepository.save(washingMachine);
    }

    @PutMapping("/{id}")
    public ResponseEntity<WashingMachine> updateWashingMachine(@PathVariable(value = "id") Long washingMachineId,
                                                               @RequestBody WashingMachine washingMachineDetails) {
        Optional<WashingMachine> optionalWashingMachine = washingMachineRepository.findById(washingMachineId);
        if (optionalWashingMachine.isPresent()) {
            WashingMachine washingMachine = optionalWashingMachine.get();
            washingMachine.setManufacturer(washingMachineDetails.getManufacturer());
            washingMachine.setTankCapacity(washingMachineDetails.getTankCapacity());
            washingMachine.setSellerId(washingMachineDetails.getSellerId());
            washingMachine.setProductType(washingMachineDetails.getProductType());
            washingMachine.setPrice(washingMachineDetails.getPrice());
            washingMachine.setName(washingMachineDetails.getName());
            return ResponseEntity.ok(washingMachineRepository.save(washingMachine));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteWashingMachine(@PathVariable(value = "id") Long washingMachineId) {
        Optional<WashingMachine> optionalWashingMachine = washingMachineRepository.findById(washingMachineId);
        if (optionalWashingMachine.isPresent()) {
            washingMachineRepository.delete(optionalWashingMachine.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
