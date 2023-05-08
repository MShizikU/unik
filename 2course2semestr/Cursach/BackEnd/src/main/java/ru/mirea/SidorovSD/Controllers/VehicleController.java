package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleDTO;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Services.VehicleService;

import java.util.List;

@RestController
@RequestMapping("/api/vehicle")
public class VehicleController {
    private final ModelMapper modelMapper;
    private final VehicleService vehicleService;

    public VehicleController(ModelMapper modelMapper, VehicleService vehicleService) {
        this.modelMapper = modelMapper;
        this.vehicleService = vehicleService;
    }

    @GetMapping("/all")
    public List<VehicleDTO> getAll(){
        return vehicleService.getAll().stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/group")
    public List<VehicleDTO> getAllByLevel(@RequestParam int idGroup){
        return vehicleService.getAllByGroup(idGroup).stream().map(this::convertToDTO).toList();
    }

    @GetMapping("/info")
    public VehicleDTO getVehicleInfo(@RequestParam String vin){
        return convertToDTO(vehicleService.getVehicle(vin));
    }

    @GetMapping("/work_model")
    public List<VehicleDTO> getByWorkModel(@RequestParam int idWorkModel){
        return vehicleService.getVehicleByWorkModel(idWorkModel).stream().map(this::convertToDTO).toList();
    }

    @PostMapping("/add")
    public Boolean addVehicle(@RequestBody VehicleDTO vehicle){
        return vehicleService.addVehicle(convertToVehicle(vehicle));
    }

    @PostMapping("/change")
    public Boolean changeVehicleInfo(@RequestParam String vin, @RequestParam int idVehicleWorkModel, @RequestParam String color, @RequestParam String state, @RequestParam String place, @RequestParam int idGroup){
        return vehicleService.changeVehicleInfo(vin, idVehicleWorkModel, color, state, place, idGroup);
    }

    @DeleteMapping()
    public Boolean deleteVehicle(@RequestParam String vin){
        return vehicleService.deleteVehicle(vin);
    }

    public VehicleDTO convertToDTO( Vehicle vehicle){
        return modelMapper.map(vehicle, VehicleDTO.class);
    }

    public Vehicle convertToVehicle(VehicleDTO vehicleDTO){
        return modelMapper.map(vehicleDTO, Vehicle.class);
    }

}
