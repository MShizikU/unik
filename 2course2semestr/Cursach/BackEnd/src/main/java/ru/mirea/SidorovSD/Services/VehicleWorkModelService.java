package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;
import ru.mirea.SidorovSD.Repos.VehicleNameRepo;
import ru.mirea.SidorovSD.Repos.VehicleWorkModelRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleWorkModelService {
    @Autowired
    private final VehicleWorkModelRepo vehicleWorkModelRepo;

    @Autowired
    private final VehicleNameRepo vehicleNameRepo;

    public VehicleWorkModelService(VehicleWorkModelRepo vehicleWorkModelRepo, VehicleNameRepo vehicleNameRepo) {
        this.vehicleWorkModelRepo = vehicleWorkModelRepo;
        this.vehicleNameRepo = vehicleNameRepo;
    }

    public List<Vehicle_work_model> getAll(){
        return vehicleWorkModelRepo.findAll();
    }

    public List<Vehicle_work_model> getAllByPrice(int pricePerHour){
        return vehicleWorkModelRepo.findByPricePerHour(pricePerHour);
    }

    public List<Vehicle_work_model> getAllByName(int idName){
        return vehicleWorkModelRepo.findByIdVehicleName(idName);
    }

    public List<Vehicle_work_model> getAllByGroup(int idGroup){
        return vehicleWorkModelRepo.findByIdGroup(idGroup);
    }

    public Vehicle_work_model getWorkModel(int idWorkModel){
        return vehicleWorkModelRepo.findByIdVehicleWorkModel(idWorkModel);
    }

    public Boolean addWorkModel(String modelPhotoName, int price_per_hour, int idVehicleName){
        Vehicle_work_model vhm = new Vehicle_work_model();

        if (vehicleNameRepo.findByIdVehicleName(idVehicleName) == null)
            return false;
        vhm.setIdVehicleName(idVehicleName);
        vhm.setModelPhotoName(modelPhotoName);
        vhm.setPricePerHour(price_per_hour);
        vehicleWorkModelRepo.save(vhm);
        return true;
    }

    public Boolean changeWorkModel(int idWorkModel, String modelPhotoName, int price_per_hour, int idVehicleName){
        Vehicle_work_model vhm = vehicleWorkModelRepo.findByIdVehicleWorkModel(idWorkModel);
        if (vhm == null)
            return false;
        if (idVehicleName != -1){
            if (vehicleNameRepo.findByIdVehicleName(idVehicleName) != null)
                vhm.setIdVehicleName(idVehicleName);
            else
                return false;
        }

        if (!modelPhotoName.equals("-"))
            vhm.setModelPhotoName(modelPhotoName);
        if (price_per_hour != -1)
            vhm.setPricePerHour(price_per_hour);

        vehicleWorkModelRepo.save(vhm);
        return Boolean.TRUE;
    }

    public Boolean deleteWorkModel(int idWorkModel){
        Vehicle_work_model vhm = vehicleWorkModelRepo.findByIdVehicleWorkModel(idWorkModel);
        if(vhm == null)
            return false;
        vehicleWorkModelRepo.delete(vhm);
        return true;
    }


}
