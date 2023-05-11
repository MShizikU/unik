package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleNameDTO;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Models.Vehicle_name;
import ru.mirea.SidorovSD.Services.VehicleNameService;

import java.util.List;

@RestController
@RequestMapping("/api/vehicle_name")
public class VehicleNameController {
    private final ModelMapper modelMapper;
    private final VehicleNameService vehicleNameService;

    private final Responser responser = new Responser();

    public VehicleNameController(ModelMapper modelMapper, VehicleNameService vehicleNameService) {
        this.modelMapper = modelMapper;
        this.vehicleNameService = vehicleNameService;
    }

    @GetMapping("/all")
    public List<VehicleNameDTO> getAll(){
        return vehicleNameService.getAllNames().stream().map(this::convertToDTO).toList();
    }

    @PostMapping("/add")
    public ResponseEntity<String> addName(@RequestParam String brandName, @RequestParam String modelName){
        return responser.createResponse(vehicleNameService.addName(brandName, modelName));

    }

    @PostMapping("/change")
    public ResponseEntity<String> changeName(@RequestParam int idName, @RequestParam String brandName, @RequestParam String modelName){
        return responser.createResponse(vehicleNameService.changeName(idName, brandName, modelName));
    }


    @DeleteMapping()
    public ResponseEntity<String> deleteName( @RequestParam String brandName, @RequestParam String modelName){
        return responser.createResponse(vehicleNameService.deleteName(brandName,modelName));
    }

    @DeleteMapping("/id")
    public ResponseEntity<String> deleteName(@RequestParam int idName){
        return responser.createResponse(vehicleNameService.deleteName(idName));
    }

    public VehicleNameDTO convertToDTO(Vehicle_name name){
        return modelMapper.map(name, VehicleNameDTO.class);
    }
}
