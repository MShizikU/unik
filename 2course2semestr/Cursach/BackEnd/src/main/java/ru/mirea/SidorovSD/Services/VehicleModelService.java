package ru.mirea.SidorovSD.Services;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Vehicle_model;
import ru.mirea.SidorovSD.Repos.VehicleModelRepo;
import ru.mirea.SidorovSD.Repos.VehicleNameRepo;

import java.util.List;

@Service
@Slf4j
public class VehicleModelService {

    @Autowired
    private final VehicleModelRepo vehicleModelRepo;

    @Autowired
    private final VehicleNameRepo vehicleNameRepo;


    public VehicleModelService(VehicleModelRepo vehicleModelRepo, VehicleNameRepo vehicleNameRepo) {
        this.vehicleModelRepo = vehicleModelRepo;
        this.vehicleNameRepo = vehicleNameRepo;
    }

    public List<Vehicle_model> getAllModels(){
        return vehicleModelRepo.findAll();
    }

    public Vehicle_model getModelByName(String modelName){
        return vehicleModelRepo.findByModelName(modelName);
    }

    public String addModel(String modelName){
        Vehicle_model model = getModelByName(modelName);
        if (model != null)
            return "Model already exist";
        model = new Vehicle_model();
        model.setModelName(modelName);
        vehicleModelRepo.save(model);
        return "OK";
    }

    public String updateModel(int idModel, String modelName){
        Vehicle_model model = vehicleModelRepo.findByIdModel(idModel);
        if (model == null)
            return "Model doesn't exist";
        model.setModelName(modelName);
        vehicleModelRepo.save(model);
        return "OK";
    }

    public String deleteModel(String modelName){
        Vehicle_model model = getModelByName(modelName);
        if (model == null)
            return "Model doesn't exist";
        if (!vehicleNameRepo.findByIdModel(model.getIdModel()).isEmpty())
            return "Model in use";
        vehicleModelRepo.delete(model);
        return "OK";
    }
}
