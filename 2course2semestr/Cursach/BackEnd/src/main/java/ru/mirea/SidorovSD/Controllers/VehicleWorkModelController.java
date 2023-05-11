package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleDTO;
import ru.mirea.SidorovSD.DTO.VehicleWorkModelDTO;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;
import ru.mirea.SidorovSD.Services.VehicleWorkModelService;

import java.util.List;

@RestController
@RequestMapping("/api/vehicle_work_model")
public class VehicleWorkModelController {
    private final ModelMapper modelMapper;
    private final VehicleWorkModelService vehicleWorkModelService;

    private final Responser responser = new Responser();

    public VehicleWorkModelController(ModelMapper modelMapper, VehicleWorkModelService vehicleWorkModelService) {
        this.modelMapper = modelMapper;
        this.vehicleWorkModelService = vehicleWorkModelService;
    }

    @GetMapping("/all")
    public List<VehicleWorkModelDTO> getAll(){
        return vehicleWorkModelService.getAll().stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/price")
    public List<VehicleWorkModelDTO> getAllByPrice(@RequestParam int pricePerHour){
        return vehicleWorkModelService.getAllByPrice(pricePerHour).stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/name")
    public List<VehicleWorkModelDTO> getAllByName(@RequestParam int idName){
        return vehicleWorkModelService.getAllByName(idName).stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/group")
    public List<VehicleWorkModelDTO> getAllByLevel(@RequestParam int idGroup){
        return vehicleWorkModelService.getAllByGroup(idGroup).stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/id")
    public VehicleWorkModelDTO getWorkModel(@RequestParam int idWorkModel){
        return convertToDTO(vehicleWorkModelService.getWorkModel(idWorkModel));
    }

    @PostMapping("/add")
    public ResponseEntity<String> addWorkModel(@RequestParam String model_photo_name, @RequestParam int price_per_hour, @RequestParam int idVehicleName, @RequestParam int idGroup){
        return responser.createResponse(vehicleWorkModelService.addWorkModel(model_photo_name, price_per_hour, idVehicleName, idGroup));
    }

    @PostMapping("/change")
    public ResponseEntity<String> changeWorkModel(@RequestParam int idWorkModel, @RequestParam String model_photo_name, @RequestParam int price_per_hour, @RequestParam int idVehicleName, @RequestParam int idGroup){
        return responser.createResponse(vehicleWorkModelService.changeWorkModel(idWorkModel, model_photo_name, price_per_hour, idVehicleName, idGroup));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteWorkModel(@RequestParam int idWorkModel){
        return responser.createResponse(vehicleWorkModelService.deleteWorkModel(idWorkModel));
    }

    public VehicleWorkModelDTO convertToDTO(Vehicle_work_model vehicle_work_model){
        return modelMapper.map(vehicle_work_model, VehicleWorkModelDTO.class);
    }

    public Vehicle_work_model convertToVehicleWorkModel(VehicleWorkModelDTO vehicleWorkModelDTO){
        return modelMapper.map(vehicleWorkModelDTO, Vehicle_work_model.class);
    }
}
