package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Repos.VehicleBrandRepo;
import ru.mirea.SidorovSD.Repos.VehicleNameRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleBrandService {

    @Autowired
    private final VehicleBrandRepo vehicleBrandRepo;

    @Autowired
    private final VehicleNameRepo vehicleNameRepo;

    public VehicleBrandService(VehicleBrandRepo vehicleBrandRepo, VehicleNameRepo vehicleNameRepo) {
        this.vehicleBrandRepo = vehicleBrandRepo;
        this.vehicleNameRepo = vehicleNameRepo;
    }

    public List<Vehicle_brand> getAllBrands(){
        return vehicleBrandRepo.findAll();
    }

    public Vehicle_brand getBrandByName(String brandName){
        return vehicleBrandRepo.findByBrandName(brandName);
    }

    public String addBrand(String brandName){
        Vehicle_brand brand = getBrandByName(brandName);
        if (brand != null)
            return "Brand already exist";
        brand = new Vehicle_brand();
        brand.setBrandName(brandName);
        vehicleBrandRepo.save(brand);
        return "OK";
    }

    public String updateBrand(int idBrand, String brandName){
        Vehicle_brand brand = vehicleBrandRepo.findByIdBrand(idBrand);
        if (brand == null)
            return "Brand already exist";
        brand.setBrandName(brandName);
        vehicleBrandRepo.save(brand);
        return "OK";
    }

    public String deleteBrand(String brandName){
        Vehicle_brand brand = getBrandByName(brandName);
        if (brand == null)
            return "Brand doesn't exist";
        if (!vehicleNameRepo.findByIdBrand(brand.getIdBrand()).isEmpty())
            return "Brand in use now in other lists";
        vehicleBrandRepo.delete(brand);
        return "OK";
    }

}
