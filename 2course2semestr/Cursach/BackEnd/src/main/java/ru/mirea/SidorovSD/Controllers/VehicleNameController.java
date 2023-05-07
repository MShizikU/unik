package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleNameDTO;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Models.Vehicle_name;
import ru.mirea.SidorovSD.Services.VehicleNameService;

import java.util.List;

@RestController
@RequestMapping("/vehicle_name")
public class VehicleNameController {
    private final ModelMapper modelMapper;
    private final VehicleNameService vehicleNameService;

    public VehicleNameController(ModelMapper modelMapper, VehicleNameService vehicleNameService) {
        this.modelMapper = modelMapper;
        this.vehicleNameService = vehicleNameService;
    }

    @GetMapping("/all")
    public List<VehicleNameDTO> getAll(){
        return vehicleNameService.getAllNames().stream().map(this::convertToDTO).toList();
    }

    @PostMapping("/add")
    public Boolean addName(@RequestParam int idBrand, @RequestParam int idModel){
        return vehicleNameService.addName(idBrand, idModel);
    }

    @PostMapping("/change")
    public Boolean changeName(@RequestParam int idName, @RequestParam int idBrand, @RequestParam int idModel){
        return vehicleNameService.changeName(idName, idBrand, idModel);
    }

    @DeleteMapping()
    public Boolean deleteName(@RequestParam int idName){
        return vehicleNameService.deleteName(idName);
    }

    public VehicleNameDTO convertToDTO(Vehicle_name name){
        return modelMapper.map(name, VehicleNameDTO.class);
    }
}
