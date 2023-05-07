package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Repos.VehicleBrandRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleBrandService {

    @Autowired
    private final VehicleBrandRepo vehicleBrandRepo;

    public VehicleBrandService(VehicleBrandRepo vehicleBrandRepo) {
        this.vehicleBrandRepo = vehicleBrandRepo;
    }

    public List<Vehicle_brand> getAllBrands(){
        return vehicleBrandRepo.findAll();
    }

    public Vehicle_brand getBrandByName(String brandName){
        return vehicleBrandRepo.findByBrandName(brandName);
    }

    public Boolean addBrand(String brandName){
        Vehicle_brand brand = getBrandByName(brandName);
        if (brand != null)
            return Boolean.FALSE;
        brand = new Vehicle_brand();
        brand.setBrandName(brandName);
        vehicleBrandRepo.save(brand);
        return Boolean.TRUE;
    }

    public Boolean updateBrand(int idBrand, String brandName){
        Vehicle_brand brand = vehicleBrandRepo.findByIdBrand(idBrand);
        if (brand == null)
            return Boolean.FALSE;
        brand.setBrandName(brandName);
        vehicleBrandRepo.save(brand);
        return Boolean.TRUE;
    }

    public Boolean deleteBrand(String brandName){
        Vehicle_brand brand = getBrandByName(brandName);
        if (brand == null)
            return false;
        vehicleBrandRepo.delete(brand);
        return Boolean.TRUE;
    }

}
