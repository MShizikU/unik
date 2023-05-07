package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle_brand;
import ru.mirea.SidorovSD.Models.Vehicle_model;
import ru.mirea.SidorovSD.Repos.VehicleModelRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleModelService {

    @Autowired
    private final VehicleModelRepo vehicleModelRepo;


    public VehicleModelService(VehicleModelRepo vehicleModelRepo) {
        this.vehicleModelRepo = vehicleModelRepo;
    }

    public List<Vehicle_model> getAllModels(){
        return vehicleModelRepo.findAll();
    }

    public Vehicle_model getModelByName(String modelName){
        return vehicleModelRepo.findByModelName(modelName);
    }

    public Boolean addModel(String modelName){
        Vehicle_model model = getModelByName(modelName);
        if (model != null)
            return Boolean.FALSE;
        model = new Vehicle_model();
        model.setModelName(modelName);
        vehicleModelRepo.save(model);
        return Boolean.TRUE;
    }

    public Boolean updateModel(int idModel, String modelName){
        Vehicle_model model = vehicleModelRepo.findByIdModel(idModel);
        if (model == null)
            return Boolean.FALSE;
        model.setModelName(modelName);
        vehicleModelRepo.save(model);
        return Boolean.TRUE;
    }

    public Boolean deleteModel(String modelName){
        Vehicle_model model = getModelByName(modelName);
        if (model == null)
            return false;
        vehicleModelRepo.delete(model);
        return Boolean.TRUE;
    }
}
