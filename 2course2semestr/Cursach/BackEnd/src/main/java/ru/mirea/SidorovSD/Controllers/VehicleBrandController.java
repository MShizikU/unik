package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.VehicleBrandDTO;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Services.VehicleBrandService;

import java.util.List;

@RestController
@RequestMapping("/api/vehicle_brand")
public class VehicleBrandController {

    private final ModelMapper modelMapper;
    private final VehicleBrandService vehicleBrandService;


    public VehicleBrandController(ModelMapper modelMapper, VehicleBrandService vehicleBrandService) {
        this.modelMapper = modelMapper;
        this.vehicleBrandService = vehicleBrandService;
    }


    @GetMapping("/all")
    public List<VehicleBrandDTO> getAll(){
        return vehicleBrandService.getAllBrands().stream().map(this::convertToDTO).toList();
    }

    @PostMapping("/add")
    public Boolean addBrand(@RequestParam String brandName){
        return vehicleBrandService.addBrand(brandName);
    }

    @PostMapping("/update")
    public Boolean updateBrand(@RequestParam int idBrand, @RequestParam String brandName){
        return vehicleBrandService.updateBrand(idBrand, brandName);
    }

    @DeleteMapping()
    public Boolean deleteBrand(@RequestParam String brandName){
        return vehicleBrandService.deleteBrand(brandName);
    }

    public VehicleBrandDTO convertToDTO(Vehicle_brand brand){
        return modelMapper.map(brand, VehicleBrandDTO.class);
    }
}
