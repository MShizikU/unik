package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

    public Boolean addName(int idBrand, int idModel){
        Vehicle_name vehicle_name = getName(idBrand, idModel);
        if (checkIfBrandExist(idBrand) && checkIfModelExist(idModel) && vehicle_name == null){
            vehicle_name.setIdBrand(idBrand);
            vehicle_name.setIdModel(idModel);
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

    public Vehicle_name getName(int idName){
        return vehicleNameRepo.findByIdVehicleName(idName);
    }
}
