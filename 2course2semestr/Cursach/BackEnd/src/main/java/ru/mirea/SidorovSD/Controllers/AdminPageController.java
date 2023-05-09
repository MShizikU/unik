package ru.mirea.SidorovSD.Controllers;

import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.mirea.SidorovSD.Services.*;

@Controller
@RequestMapping("/crm")
public class AdminPageController {

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

    public AdminPageController(LevelService levelService, GroupService groupService, PermissionService permissionService, RentService rentService, UserService userService, VehicleBrandService vehicleBrandService, VehicleService vehicleService, VehicleModelService vehicleModelService, VehicleNameService vehicleNameService, VehicleWorkModelService vehicleWorkModelService) {
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

    @RequestMapping("/admin_rent")
    public ModelAndView getAdminRent(){
        ModelAndView modelAndView = new ModelAndView("admin_rent");
        modelAndView.addObject("rents", rentService.getAll());
        return modelAndView;
    }

    @RequestMapping("/admin_names")
    public ModelAndView getAdminNames(){
        return new ModelAndView("admin_names")
                .addObject("models", vehicleModelService.getAllModels())
                .addObject("brands", vehicleBrandService.getAllBrands())
                .addObject("names" , vehicleNameService.getAllNames());
    }

    @RequestMapping("/admin_permissions")
    public ModelAndView getAdminPermissions(){
        return new ModelAndView("admin_permissions")
                .addObject("levels", levelService.findAll())
                .addObject("groups", groupService.findAll())
                .addObject("permissions", permissionService.getAll());
    }

    @RequestMapping("/admin_users")
    public ModelAndView getAdminUsers(){
        return new ModelAndView("admin_users")
                .addObject("users", userService.getAll());
    }

    @RequestMapping("/admin_vehicles")
    public ModelAndView getAdminVehicles(){
        return new ModelAndView("admin_vehicles")
                .addObject("vehicles", vehicleService.getAll());
    }

    @RequestMapping("/admin_work_models")
    public ModelAndView getAdminWorkModels(){
        return new ModelAndView("admin_work_models")
                .addObject("work_models", vehicleWorkModelService.getAll());
    }
}
