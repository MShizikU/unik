package mirea.ru.carsharing.controller;

import com.nimbusds.jose.util.Pair;
import lombok.extern.slf4j.Slf4j;
import mirea.ru.carsharing.model.Rent;
import mirea.ru.carsharing.model.User;
import mirea.ru.carsharing.model.Vehicle;
import mirea.ru.carsharing.model.VehicleWorkModel;
import mirea.ru.carsharing.service.*;
import mirea.ru.carsharing.utilities.ExecutionResult;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;

@Controller
@Slf4j
@RequestMapping("/api")
public class PageController {

    private final UserLevelService levelService;
    private final VehicleGroupService groupService;
    private final PermissionService permissionService;
    private final RentService rentService;
    private final UserService userService;
    private final VehicleBrandService vehicleBrandService;
    private final VehicleService vehicleService;
    private final VehicleModelService vehicleModelService;
    private final VehicleNameService vehicleNameService;
    private final VehicleWorkModelService vehicleWorkModelService;

    private static final Logger logger = Logger.getLogger(PageController.class.getName());

    public PageController(UserLevelService levelService, VehicleGroupService groupService, PermissionService permissionService, RentService rentService, UserService userService, VehicleBrandService vehicleBrandService, VehicleService vehicleService, VehicleModelService vehicleModelService, VehicleNameService vehicleNameService, VehicleWorkModelService vehicleWorkModelService) {
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
    }

    @RequestMapping("/start")
    public ModelAndView getMainPage(){
        ModelAndView modelAndView = new ModelAndView("index");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String principal = authentication.getPrincipal().toString();
        ExecutionResult<User> muser = userService.getUserByUsername(principal);

        User curUser = muser.getResult();

        List<VehicleWorkModel> allowedWorkModels = new LinkedList<>();
        List<Vehicle> allowedVehicles = new LinkedList<>();
        permissionService
                .getPermissionByUserLevel(curUser.getIdLevel())
                .getResult()
                .stream()
                .map(permission -> vehicleWorkModelService.getVehicleWorkModelByVehicleGroup(permission.getIdGroup()).getResult())
                .forEach(workModel ->  allowedWorkModels.addAll(workModel));
        List<String> allowedCarsNames = allowedWorkModels.stream().map(it -> vehicleNameService.getVehicleName(it.getIdVehicleName()).getResult()).toList();
        List<Pair<VehicleWorkModel, String>> pairs = new LinkedList<>();
        for (int i = 0; i < allowedCarsNames.size() && i < allowedWorkModels.size(); i++){
            pairs.add(Pair.of(allowedWorkModels.get(i), allowedCarsNames.get(i)));
            allowedVehicles.addAll(vehicleService.getVehicleByWorkModel(allowedWorkModels.get(i).getIdVehicleWorkModel()).getResult());
        }
        ExecutionResult<Rent> currentRent = rentService.getActiveRent(curUser.getSnpassport());
        if (currentRent.getErrorMessage() == null && currentRent.getResult() != null){
            VehicleWorkModel curVehicleModel =  vehicleWorkModelService.getVehicleWorkModelById(vehicleService.getVehicleById(currentRent.getResult().getVin()).getResult().getIdVehicleWorkModel()).getResult();
            String vehicleName = vehicleNameService.getVehicleName(curVehicleModel.getIdVehicleName()).getResult();
            modelAndView.addObject("vehicle_model", curVehicleModel);
            modelAndView.addObject("vehicle_name", vehicleName);
        }
        modelAndView.addObject("vehicles", allowedVehicles);
        modelAndView.addObject("pairs", pairs);
        modelAndView.addObject("muser", curUser);
        modelAndView.addObject("rent",currentRent.getResult());
        return modelAndView;
    }

    @RequestMapping("/profile")
    public ModelAndView getProfilePage(){
        ModelAndView modelAndView = new ModelAndView("profile");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String principal = authentication.getPrincipal().toString();
        ExecutionResult<User> muser = userService.getUserByUsername(principal);

        User curUser = muser.getResult();

        User user = userService.getUserByUsername(curUser.getUsername()).getResult();
        ExecutionResult<Rent> currentRent = rentService.getActiveRent(user.getSnpassport());
        List<Rent> rents = rentService.getRentBySnpassport(user.getSnpassport()).getResult();
        if (currentRent.getErrorMessage() == null && currentRent.getResult() != null){
            VehicleWorkModel curVehicleModel = vehicleWorkModelService.getVehicleWorkModelById(vehicleService.getVehicleById(currentRent.getResult().getVin()).getResult().getIdVehicleWorkModel()).getResult();
            String vehicleName = vehicleNameService.getVehicleName(curVehicleModel.getIdVehicleName()).getResult();
            modelAndView.addObject("vehicle_model", curVehicleModel);
            modelAndView.addObject("vehicle_name", vehicleName);
        }
        modelAndView.addObject("rents", rents);
        modelAndView.addObject("muser", user);
        modelAndView.addObject("level", levelService.getUserLevelById(user.getIdLevel()).getResult());
        modelAndView.addObject("rent", currentRent.getResult());
        return modelAndView;
    }

}
