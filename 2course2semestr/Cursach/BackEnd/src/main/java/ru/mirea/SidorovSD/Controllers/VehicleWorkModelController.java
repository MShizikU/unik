package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleWorkModelDTO;
import ru.mirea.SidorovSD.Services.VehicleWorkModelService;

import java.util.List;

@RestController
@RequestMapping("/vehicle_work_model")
public class VehicleWorkModelController {
    private final ModelMapper modelMapper;
    private final VehicleWorkModelService vehicleWorkModelService;

    public VehicleWorkModelController(ModelMapper modelMapper, VehicleWorkModelService vehicleWorkModelService) {
        this.modelMapper = modelMapper;
        this.vehicleWorkModelService = vehicleWorkModelService;
    }

    @GetMapping("/all")
    public List<VehicleWorkModelDTO> getAll(){
        return
    }

    @GetMapping("/price")
    public List<VehicleWorkModelDTO> getAllByPrice(){
    }

    @GetMapping("/name")
    public List<VehicleWorkModelDTO> getAllByName(){

    }

    @GetMapping("/id")
    public VehicleWorkModelDTO getWorkModel(){

    }

    @PostMapping("/add")
    public Boolean addWorkModel(@RequestParam String model_photo_name, @RequestParam String price_per_hour, @RequestParam int idVehicleName)
}
