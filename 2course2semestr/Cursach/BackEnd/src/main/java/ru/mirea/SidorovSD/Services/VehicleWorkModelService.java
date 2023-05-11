package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;
import ru.mirea.SidorovSD.Repos.GroupRepo;
import ru.mirea.SidorovSD.Repos.VehicleNameRepo;
import ru.mirea.SidorovSD.Repos.VehicleRepo;
import ru.mirea.SidorovSD.Repos.VehicleWorkModelRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleWorkModelService {
    @Autowired
    private final VehicleWorkModelRepo vehicleWorkModelRepo;

    @Autowired
    private final VehicleNameRepo vehicleNameRepo;

    @Autowired
    private final GroupRepo groupRepo;

    @Autowired
    private final VehicleRepo vehicleRepo;

    public VehicleWorkModelService(VehicleWorkModelRepo vehicleWorkModelRepo, VehicleNameRepo vehicleNameRepo, GroupRepo groupRepo, VehicleRepo vehicleRepo) {
        this.vehicleWorkModelRepo = vehicleWorkModelRepo;
        this.vehicleNameRepo = vehicleNameRepo;
        this.groupRepo = groupRepo;
        this.vehicleRepo = vehicleRepo;
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

    public String addWorkModel(String modelPhotoName, int price_per_hour, int idVehicleName, int idGroup){
        Vehicle_work_model vhm = new Vehicle_work_model();

        if (vehicleNameRepo.findByIdVehicleName(idVehicleName) == null)
            return "Name doesn't exist";

        vhm.setIdVehicleName(idVehicleName);
        vhm.setModelPhotoName(modelPhotoName);
        vhm.setPricePerHour(price_per_hour);
        vhm.setIdGroup(idGroup);
        vehicleWorkModelRepo.save(vhm);
        return "OK";
    }

    public String changeWorkModel(int idWorkModel, String modelPhotoName, int price_per_hour, int idVehicleName, int idGroup){
        Vehicle_work_model vhm = vehicleWorkModelRepo.findByIdVehicleWorkModel(idWorkModel);
        if (vhm == null)
            return "Work model doesn't exist";
        if (idVehicleName != -1){
            if (vehicleNameRepo.findByIdVehicleName(idVehicleName) != null)
                vhm.setIdVehicleName(idVehicleName);
            else
                return "Vehicle name doesn't exist";
        }

        if(idGroup != -1){
            if (groupRepo.findByIdGroup(idGroup) != null){
                vhm.setIdGroup(idGroup);
            }else{
                return "Group doesn't exist";
            }
        }

        if (!modelPhotoName.equals("-"))
            vhm.setModelPhotoName(modelPhotoName);
        if (price_per_hour != -1)
            vhm.setPricePerHour(price_per_hour);

        vehicleWorkModelRepo.save(vhm);
        return "OK";
    }

    public String deleteWorkModel(int idWorkModel){
        Vehicle_work_model vhm = vehicleWorkModelRepo.findByIdVehicleWorkModel(idWorkModel);
        if(vhm == null)
            return "Work model doesn't exist";
        if(!vehicleRepo.findByIdVehicleWorkModel(idWorkModel).isEmpty())
            return "Work Model in use";
        vehicleWorkModelRepo.delete(vhm);
        return "OK";
    }


}
