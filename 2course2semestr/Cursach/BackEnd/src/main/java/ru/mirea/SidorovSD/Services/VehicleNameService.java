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
import ru.mirea.SidorovSD.Repos.VehicleWorkModelRepo;

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

    @Autowired
    private final VehicleWorkModelRepo vehicleWorkModelRepo;

    public VehicleNameService(VehicleNameRepo vehicleNameRepo, VehicleBrandRepo vehicleBrandRepo, VehicleModelRepo vehicleModelRepo, VehicleWorkModelRepo vehicleWorkModelRepo) {
        this.vehicleNameRepo = vehicleNameRepo;
        this.vehicleBrandRepo = vehicleBrandRepo;
        this.vehicleModelRepo = vehicleModelRepo;
        this.vehicleWorkModelRepo = vehicleWorkModelRepo;
    }

    public List<Vehicle_name> getAllNames(){
        return vehicleNameRepo.findAll();
    }

    public String addName(String brandName, String modelName){

        Vehicle_brand vehicle_brand  = vehicleBrandRepo.findByBrandName(brandName);
        Vehicle_model vehicle_model = vehicleModelRepo.findByModelName(modelName);
        if (vehicle_brand != null && vehicle_model != null) {
            Vehicle_name vehicle_name = getName(brandName, modelName);
            if (vehicle_name == null){
                vehicle_name = new Vehicle_name();
                vehicle_name.setIdBrand(vehicle_brand.getIdBrand());
                vehicle_name.setIdModel(vehicle_model.getIdModel());
                vehicleNameRepo.save(vehicle_name);
                return "OK";
            }
            else
                return "Name doesn't exist";
        }
        else{
            return "Brand or Model doesn't exist";
        }
    }

    public String changeName(int idName, String brandName, String modelName){
        Vehicle_name vehicle_name = getName(idName);
        if (vehicle_name == null)
            return "Name doesn't exist";

        if (!brandName.equals("-")) {
            Vehicle_brand brand = vehicleBrandRepo.findByBrandName(brandName);
            if (brand != null)
                vehicle_name.setIdBrand(brand.getIdBrand());
            else
                return "Brand name doesn't exist";
        }

        if(!modelName.equals("-")){
            Vehicle_model model = vehicleModelRepo.findByModelName(modelName);
            if (model != null)
                vehicle_name.setIdModel(model.getIdModel());
            else
                return "Model name doesn't exist";
        }
        vehicleNameRepo.save(vehicle_name);
        return "OK";

    }

    public String deleteName(int idName){
        Vehicle_name vehicle_name = getName(idName);
        if (vehicle_name == null)
            return "Name doesn't exist";
        if (!vehicleWorkModelRepo.findByIdVehicleName(idName).isEmpty())
            return "Name in user";
        vehicleNameRepo.delete(vehicle_name);
        return "OK";
    }

    public String deleteName(String brandName, String modelName){

        Vehicle_name vehicle_name = getName(brandName,modelName);
        if (vehicle_name == null)
            return "Name doesn't exist";
        if (!vehicleWorkModelRepo.findByIdVehicleName(vehicle_name.getIdVehicleName()).isEmpty())
            return "Name in user";
        vehicleNameRepo.deleteById(vehicle_name.getIdVehicleName());
        return "OK";
    }

    public Boolean checkIfBrandExist(int idBrand){
        return vehicleBrandRepo.existsById(idBrand);
    }

    public Boolean checkIfBrandExist(String brandName){
        return vehicleBrandRepo.findByBrandName(brandName) != null;
    }

    public Boolean checkIfModelExist(int idModel){
        return vehicleModelRepo.existsById(idModel);
    }

    public Boolean checkIfModelExist(String modelName){
        return vehicleModelRepo.findByModelName(modelName) != null;
    }

    public Vehicle_name getName(int idBrand, int idModel){
        return vehicleNameRepo.findByIdBrandAndIdModel(idBrand, idModel);
    }

    public Vehicle_name getName(String brandName, String modelName){
        Vehicle_brand brand = vehicleBrandRepo.findByBrandName(brandName);
        Vehicle_model model = vehicleModelRepo.findByModelName(modelName);
        if(brand == null || model == null) return null;
        return vehicleNameRepo.findByIdBrandAndIdModel(brand.getIdBrand(), model.getIdModel());
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
