package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleModelDTO;
import ru.mirea.SidorovSD.Models.Vehicle_model;
import ru.mirea.SidorovSD.Services.VehicleModelService;

import java.util.List;

@RestController
@RequestMapping("/api/vehicle_model")
public class VehicleModelController {
    private final ModelMapper modelMapper;
    private final VehicleModelService vehicleModelService;

    private final Responser responser = new Responser();

    public VehicleModelController(ModelMapper modelMapper, VehicleModelService vehicleModelService) {
        this.modelMapper = modelMapper;
        this.vehicleModelService = vehicleModelService;
    }

    @GetMapping("/all")
    public List<VehicleModelDTO> getAll(){
        return vehicleModelService.getAllModels().stream().map(this::convertToDTO).toList();
    }

    @PostMapping("/add")
    public ResponseEntity<String> addModel(@RequestParam String modelName){
       return responser.createResponse(vehicleModelService.addModel(modelName));
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateModel(@RequestParam int idModel, @RequestParam String modelName){
        return responser.createResponse(vehicleModelService.updateModel(idModel, modelName));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteModel(@RequestParam String modelName){
        return responser.createResponse(vehicleModelService.deleteModel(modelName));
    }

    public VehicleModelDTO convertToDTO(Vehicle_model vehicle_model){
        return modelMapper.map(vehicle_model, VehicleModelDTO.class);
    }
}
