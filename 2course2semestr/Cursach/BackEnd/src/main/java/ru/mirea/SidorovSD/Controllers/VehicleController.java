package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
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

    private final Responser responser = new Responser();

    public VehicleController(ModelMapper modelMapper, VehicleService vehicleService) {
        this.modelMapper = modelMapper;
        this.vehicleService = vehicleService;
    }

    @GetMapping("/all")
    public List<VehicleDTO> getAll(){
        return vehicleService.getAll().stream().map(this::convertToDTO).toList();
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
    public ResponseEntity<String> addVehicle(@RequestBody VehicleDTO vehicle){
        return responser.createResponse(vehicleService.addVehicle(convertToVehicle(vehicle)));
    }

    @PostMapping("/change")
    public ResponseEntity<String> changeVehicleInfo(@RequestParam String vin, @RequestParam int idVehicleWorkModel, @RequestParam String color, @RequestParam String state, @RequestParam String place){
        return responser.createResponse(vehicleService.changeVehicleInfo(vin, idVehicleWorkModel, color, state, place));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteVehicle(@RequestParam String vin){

        return responser.createResponse(vehicleService.deleteVehicle(vin));
    }

    public VehicleDTO convertToDTO( Vehicle vehicle){
        return modelMapper.map(vehicle, VehicleDTO.class);
    }

    public Vehicle convertToVehicle(VehicleDTO vehicleDTO){
        return modelMapper.map(vehicleDTO, Vehicle.class);
    }

}
