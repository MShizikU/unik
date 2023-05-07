package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleModelDTO;
import ru.mirea.SidorovSD.Models.Vehicle_model;
import ru.mirea.SidorovSD.Services.VehicleModelService;
import ru.mirea.SidorovSD.Services.VehicleService;

import java.util.List;

@RestController
@RequestMapping("/api/vehicle_model")
public class VehicleModelController {
    private final ModelMapper modelMapper;
    private final VehicleModelService vehicleModelService;

    public VehicleModelController(ModelMapper modelMapper, VehicleModelService vehicleModelService) {
        this.modelMapper = modelMapper;
        this.vehicleModelService = vehicleModelService;
    }

    @GetMapping("/all")
    public List<VehicleModelDTO> getAll(){
        return vehicleModelService.getAllModels().stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/add")
    public Boolean addModel(@RequestParam String modelName){
        return vehicleModelService.addModel(modelName);
    }

    @GetMapping("/update")
    public Boolean updateModel(@RequestParam int idModel, @RequestParam String modelName){
        return vehicleModelService.updateModel(idModel, modelName);
    }

    @DeleteMapping()
    public Boolean deleteModel(@RequestParam String modelName){
        return vehicleModelService.deleteModel(modelName);
    }

    public VehicleModelDTO convertToDTO(Vehicle_model vehicle_model){
        return modelMapper.map(vehicle_model, VehicleModelDTO.class);
    }
}
