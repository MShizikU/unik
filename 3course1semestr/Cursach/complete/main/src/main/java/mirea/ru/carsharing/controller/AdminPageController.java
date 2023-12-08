package mirea.ru.carsharing.controller;

import mirea.ru.carsharing.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api/admin")
public class AdminPageController {

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

    public AdminPageController(UserLevelService levelService, VehicleGroupService groupService, PermissionService permissionService, RentService rentService, UserService userService, VehicleBrandService vehicleBrandService, VehicleService vehicleService, VehicleModelService vehicleModelService, VehicleNameService vehicleNameService, VehicleWorkModelService vehicleWorkModelService) {
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

    @RequestMapping("/rents")
    public ModelAndView getAdminRent(){
        ModelAndView modelAndView = new ModelAndView("admin_rent");
        modelAndView.addObject("rents", rentService.getAllRents().getResult());
        return modelAndView;
    }

    @RequestMapping("/vehicle/names")
    public ModelAndView getAdminNames(){
        return new ModelAndView("admin_names")
                .addObject("models", vehicleModelService.getAllVehicleModels().getResult())
                .addObject("brands", vehicleBrandService.getAllVehicleBrands().getResult())
                .addObject("names" , vehicleNameService.getAll().getResult());
    }

    @RequestMapping("/permissions")
    public ModelAndView getAdminPermissions(){
        return new ModelAndView("admin_permissions")
                .addObject("levels", levelService.getAllUserLevels().getResult())
                .addObject("groups", groupService.getAllVehicleGroups().getResult())
                .addObject("permissions", permissionService.getAllPermissions().getResult());
    }

    @RequestMapping("/users")
    public ModelAndView getAdminUsers(){
        return new ModelAndView("admin_users")
                .addObject("users", userService.getAllUsers().getResult());
    }

    @RequestMapping("/vehicle")
    public ModelAndView getAdminVehicles(){
        return new ModelAndView("admin_vehicles")
                .addObject("vehicles", vehicleService.getAllVehicles().getResult());
    }

    @RequestMapping("/vehicle/work_models")
    public ModelAndView getAdminWorkModels(){
        return new ModelAndView("admin_work_models")
                .addObject("work_models", vehicleWorkModelService.getAllVehicleWorkModels().getResult());
    }
}