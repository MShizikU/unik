package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

    private final Responser responser = new Responser();


    public VehicleBrandController(ModelMapper modelMapper, VehicleBrandService vehicleBrandService) {
        this.modelMapper = modelMapper;
        this.vehicleBrandService = vehicleBrandService;
    }


    @GetMapping("/all")
    public List<VehicleBrandDTO> getAll(){
        return vehicleBrandService.getAllBrands().stream().map(this::convertToDTO).toList();
    }

    @PostMapping("/add")
    public ResponseEntity<String> addBrand(@RequestParam String brandName){
        return responser.createResponse(vehicleBrandService.addBrand(brandName));
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateBrand(@RequestParam int idBrand, @RequestParam String brandName){
        return responser.createResponse(vehicleBrandService.updateBrand(idBrand, brandName));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteBrand(@RequestParam String brandName){
        return responser.createResponse(vehicleBrandService.deleteBrand(brandName));
    }

    public VehicleBrandDTO convertToDTO(Vehicle_brand brand){
        return modelMapper.map(brand, VehicleBrandDTO.class);
    }
}
