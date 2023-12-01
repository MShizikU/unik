package mirea.ru.carsharing.service;

import mirea.ru.carsharing.model.VehicleBrand;
import mirea.ru.carsharing.repos.VehicleBrandRepo;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VehicleBrandService {
    private final VehicleBrandRepo vehicleBrandRepository;

    public VehicleBrandService(VehicleBrandRepo vehicleBrandRepository) {
        this.vehicleBrandRepository = vehicleBrandRepository;
    }

    public ExecutionResult<VehicleBrand> createVehicleBrand(VehicleBrand vehicleBrand) {
        Optional<VehicleBrand> existingBrand = vehicleBrandRepository.findByBrandNameAndDivision(vehicleBrand.getBrandName(), vehicleBrand.getDivision());
        if (existingBrand.isPresent()) {
            return ExecutionResult.error("Vehicle brand with the same name and division already exists.");
        }
        try{
            VehicleBrand savedBrand = vehicleBrandRepository.save(vehicleBrand);
            return ExecutionResult.success(savedBrand);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to create vehicle brand");
        }
    }

    public ExecutionResult<VehicleBrand> updateVehicleBrand(Integer id, VehicleBrand updatedBrand) {
        VehicleBrand existingBrand = vehicleBrandRepository.findById(id).orElse(null);
        if (existingBrand == null) {
            return ExecutionResult.error("VehicleBrand not found");
        }
        try{
            if (updatedBrand.getBrandName() != null) {
                existingBrand.setBrandName(updatedBrand.getBrandName());
            }
            if (updatedBrand.getDivision() != null) {
                existingBrand.setDivision(updatedBrand.getDivision());
            }

            VehicleBrand updatedVehicleBrand = vehicleBrandRepository.save(existingBrand);
            return ExecutionResult.success(updatedVehicleBrand);
        }
        catch (Exception ex){
            return ExecutionResult.error("Unable to update VehicleBrand: " + ex.getMessage());
        }
    }

    public ExecutionResult<VehicleBrand> getVehicleBrandById(Integer id) {
        Optional<VehicleBrand> vehicleBrand = vehicleBrandRepository.findById(id);
        if (vehicleBrand.isPresent()) {
            return ExecutionResult.success(vehicleBrand.get());
        } else {
            return ExecutionResult.error("Vehicle brand not found.");
        }
    }

    public ExecutionResult<List<VehicleBrand>> getAllVehicleBrands() {
        List<VehicleBrand> vehicleBrands = vehicleBrandRepository.findAll();
        return ExecutionResult.success(vehicleBrands);
    }

    public ExecutionResult<Void> deleteVehicleBrand(Integer id) {
        if (vehicleBrandRepository.existsById(id)) {
            vehicleBrandRepository.deleteById(id);
            return ExecutionResult.success(null);
        } else {
            return ExecutionResult.error("Vehicle brand not found.");
        }
    }
}
