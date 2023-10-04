package com.example.getcontact.controller;

import com.example.getcontact.entity.Telephone;
import com.example.getcontact.repository.TelephoneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/api/v1/telephones")
public class TelephoneController {
    @Autowired
    private TelephoneRepository telephoneRepository;

    @GetMapping("/")
    public ResponseEntity<List<Telephone>> getAllTelephones() {
        return ResponseEntity.ofNullable(telephoneRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Telephone> getTelephoneById(@PathVariable(value = "id") Long telephoneId) {
        Optional<Telephone> telephone = telephoneRepository.findById(telephoneId);
        if (telephone.isPresent()) {
            return ResponseEntity.ok().body(telephone.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/")
    public ResponseEntity<Telephone> createTelephone(@RequestBody Telephone telephone) {
        return ResponseEntity.ofNullable(telephoneRepository.save(telephone));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Telephone> updateTelephone(@PathVariable(value = "id") Long telephoneId,
                                                      @RequestBody Telephone telephoneDetails) {
        Optional<Telephone> optionalTelephone = telephoneRepository.findById(telephoneId);
        if (optionalTelephone.isPresent()) {
            Telephone telephone = optionalTelephone.get();
            telephone.setManufacturer(telephoneDetails.getManufacturer());
            telephone.setBatteryCapacity(telephoneDetails.getBatteryCapacity());
            telephone.setSellerId(telephoneDetails.getSellerId());
            telephone.setProductType(telephoneDetails.getProductType());
            telephone.setPrice(telephoneDetails.getPrice());
            telephone.setName(telephoneDetails.getName());
            return ResponseEntity.ok(telephoneRepository.save(telephone));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTelephone(@PathVariable(value = "id") Long telephoneId) {
        Optional<Telephone> optionalTelephone = telephoneRepository.findById(telephoneId);
        if (optionalTelephone.isPresent()) {
            telephoneRepository.delete(optionalTelephone.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
