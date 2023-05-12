package ru.mirea.SidorovSD.Controllers;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.tuple.Pair;
import org.modelmapper.ModelMapper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.mirea.SidorovSD.DTO.VehicleDTO;
import ru.mirea.SidorovSD.Models.Rent;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Models.Vehicle_work_model;
import ru.mirea.SidorovSD.Services.*;

import java.util.LinkedList;
import java.util.List;

@Controller
@Slf4j
public class PageController {

    private final LevelService levelService;
    private final GroupService groupService;
    private final PermissionService permissionService;
    private final RentService rentService;
    private final UserService userService;
    private final VehicleBrandService vehicleBrandService;
    private final VehicleService vehicleService;
    private final VehicleModelService vehicleModelService;
    private final VehicleNameService vehicleNameService;
    private final VehicleWorkModelService vehicleWorkModelService;

    private final ModelMapper modelMapper;

    public PageController(LevelService levelService, GroupService groupService, PermissionService permissionService, RentService rentService, UserService userService, VehicleBrandService vehicleBrandService, VehicleService vehicleService, VehicleModelService vehicleModelService, VehicleNameService vehicleNameService, VehicleWorkModelService vehicleWorkModelService, ModelMapper modelMapper) {
        this.levelService = levelService;
        this.groupService = groupService;
        this.permissionService = permissionService;
        this.rentService = rentService;
        this.userService = userService;
        this.vehicleBrandService = vehicleBrandService;
        this.vehicleService = vehicleService;
        this.vehicleModelService = vehicleModelService;
        this.vehicleNameService = vehicleNameService;
        this.vehicleWorkModelService = vehicleWorkModelService;
        this.modelMapper = modelMapper;
    }

    @RequestMapping("/start")
    public ModelAndView getMainPage(@AuthenticationPrincipal UserDetails user){
        ModelAndView modelAndView = new ModelAndView("index");
        User muser = userService.findBySnpassport(user.getUsername().toString());
        log.info("Role: " + muser.getRole());
        List<Vehicle_work_model> allowedWorkModels = new LinkedList<>();
        List<Vehicle> allowedVehicles = new LinkedList<>();
        permissionService
                .allPermissionsByLevel(
                        muser.getIdLevel()
                ).stream().map(
                        permission
                                -> vehicleWorkModelService
                                .getAllByGroup(
                                        permission.getIdGroup()
                                )
                )
                .forEach(
                        allowedWorkModels::addAll
                );
        List<String> allowedCarsNames = allowedWorkModels.stream().map(it -> vehicleNameService.getVehicleName(it.getIdVehicleName())).toList();
        List<Pair<Vehicle_work_model, String>> pairs = new LinkedList<>();
        for (int i = 0; i < allowedCarsNames.size() && i < allowedWorkModels.size(); i++){
            pairs.add(Pair.of(allowedWorkModels.get(i), allowedCarsNames.get(i)));
            allowedVehicles.addAll(vehicleService.getVehicleByWorkModel(allowedWorkModels.get(i).getIdVehicleWorkModel()));
        }
        Rent currentRent = rentService.getCurrentRent(muser.getSnpassport());
        if (currentRent != null){
            Vehicle_work_model curVehicleModel =  vehicleWorkModelService.getWorkModel(vehicleService.getVehicle(currentRent.getVin()).getIdVehicleWorkModel());
            String vehicleName = vehicleNameService.getVehicleName(curVehicleModel.getIdVehicleName());
            modelAndView.addObject("vehicle_model", curVehicleModel);
            modelAndView.addObject("vehicle_name", vehicleName);
        }
        modelAndView.addObject("vehicles", allowedVehicles);
        modelAndView.addObject("pairs", pairs);
        modelAndView.addObject("muser", muser);
        modelAndView.addObject("rent",currentRent);
        return modelAndView;
    }

    @RequestMapping("/profile")
    public ModelAndView getProfilePage(@AuthenticationPrincipal UserDetails user){
        ModelAndView modelAndView = new ModelAndView("profile");
        User muser = userService.findBySnpassport(user.getUsername());
        Rent currentRent = rentService.getCurrentRent(muser.getSnpassport());
        List<Rent> rents = rentService.getAllByPass(muser.getSnpassport());
        if (currentRent != null){
            Vehicle_work_model curVehicleModel =  vehicleWorkModelService.getWorkModel(vehicleService.getVehicle(currentRent.getVin()).getIdVehicleWorkModel());
            String vehicleName = vehicleNameService.getVehicleName(curVehicleModel.getIdVehicleName());
            modelAndView.addObject("vehicle_model", curVehicleModel);
            modelAndView.addObject("vehicle_name", vehicleName);
        }
        modelAndView.addObject("rents", rents);
        modelAndView.addObject("muser", muser);
        modelAndView.addObject("level", levelService.findById(muser.getIdLevel()));
        modelAndView.addObject("rent", currentRent);
        return modelAndView;
    }

    public VehicleDTO convertToVehicleDTO(Vehicle vehicle){
        return modelMapper.map(vehicle, VehicleDTO.class);
    }

    public Vehicle convertToVehicle(VehicleDTO vehicleDTO){
        return modelMapper.map(vehicleDTO, Vehicle.class);
    }

}
