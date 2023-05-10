package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Models.Vehicle_model;
import ru.mirea.SidorovSD.Models.Vehicle_name;
import ru.mirea.SidorovSD.Repos.VehicleBrandRepo;
import ru.mirea.SidorovSD.Repos.VehicleModelRepo;
import ru.mirea.SidorovSD.Repos.VehicleNameRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleNameService {
    @Autowired
    private final VehicleNameRepo vehicleNameRepo;

    @Autowired
    private final VehicleBrandRepo vehicleBrandRepo;

    @Autowired
    private final VehicleModelRepo vehicleModelRepo;

    public VehicleNameService(VehicleNameRepo vehicleNameRepo, VehicleBrandRepo vehicleBrandRepo, VehicleModelRepo vehicleModelRepo) {
        this.vehicleNameRepo = vehicleNameRepo;
        this.vehicleBrandRepo = vehicleBrandRepo;
        this.vehicleModelRepo = vehicleModelRepo;
    }

    public List<Vehicle_name> getAllNames(){
        return vehicleNameRepo.findAll();
    }

    public Boolean addName(String brandName, String modelName){
        Vehicle_name vehicle_name = getName(brandName, modelName);
        Vehicle_brand vehicle_brand  = vehicleBrandRepo.findByBrandName(brandName);
        Vehicle_model vehicle_model = vehicleModelRepo.findByModelName(modelName);
        if (vehicle_brand != null && vehicle_model != null && vehicle_name == null){
            vehicle_name = new Vehicle_name();
            vehicle_name.setIdBrand(vehicle_name.getIdBrand());
            vehicle_name.setIdModel(vehicle_model.getIdModel());
            vehicleNameRepo.save(vehicle_name);
            return Boolean.TRUE;
        }
        else
            return Boolean.FALSE;
    }

    public Boolean changeName(int idName, int idBrand, int idModel){
        Vehicle_name vehicle_name = getName(idName);
        if (vehicle_name == null)
            return Boolean.FALSE;

        if (idBrand != -1) {
            if (checkIfBrandExist(idBrand))
                vehicle_name.setIdBrand(idBrand);
            else
                return false;
        }

        if(idModel != -1){
            if (checkIfModelExist(idModel))
                vehicle_name.setIdModel(idModel);
            else
                return false;
        }

        return Boolean.TRUE;

    }

    public Boolean deleteName(int idName){
        Vehicle_name vehicle_name = getName(idName);
        if (vehicle_name == null)
            return false;
        vehicleNameRepo.delete(vehicle_name);
        return true;
    }

    public Boolean checkIfBrandExist(int idBrand){
        return vehicleBrandRepo.existsById(idBrand);
    }

    public Boolean checkIfModelExist(int idModel){
        return vehicleModelRepo.existsById(idModel);
    }

    public Vehicle_name getName(int idBrand, int idModel){
        return vehicleNameRepo.findByIdBrandAndIdModel(idBrand, idModel);
    }

    public Vehicle_name getName(String brandName, String modelName){

        return vehicleNameRepo.findByIdBrandAndIdModel(vehicleBrandRepo.findByBrandName(brandName).getIdBrand(), vehicleModelRepo.findByModelName(modelName).getIdModel());
    }

    public Vehicle_name getName(int idName){
        return vehicleNameRepo.findByIdVehicleName(idName);
    }

    public String getVehicleName(int idName){
         Vehicle_name name = getName(idName);
         if (name == null)
             return "";
         return vehicleBrandRepo.findByIdBrand(name.getIdBrand()).getBrandName() + " " + vehicleModelRepo.findByIdModel(name.getIdModel()).getModelName();
    }
}
