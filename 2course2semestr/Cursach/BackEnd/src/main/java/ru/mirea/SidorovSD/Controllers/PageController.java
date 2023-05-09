package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.mirea.SidorovSD.DTO.VehicleDTO;
import ru.mirea.SidorovSD.Models.User;
import ru.mirea.SidorovSD.Models.Vehicle;
import ru.mirea.SidorovSD.Services.*;

import java.util.LinkedList;
import java.util.List;

@Controller
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
        System.out.println(user.getUsername());
        User muser = userService.findBySnpassport(user.getUsername().toString());
        List<VehicleDTO> allowedCars = new LinkedList<>();
        permissionService
                .allPermissionsByLevel(
                        muser.getIdLevel()
                ).forEach(
                        permission ->
                                allowedCars
                                        .addAll(
                                                vehicleService
                                                        .getAllByGroup(
                                                                permission.getIdGroup()
                                                        )
                                                        .stream()
                                                        .map(
                                                                this::convertToVehicleDTO
                                                        )
                                                        .toList()
                                        )
                );
        modelAndView.addObject("vehicles", allowedCars);
        modelAndView.addObject("muser", muser);
        modelAndView.addObject("rent",rentService.getCurrentRent(muser.getSnpassport()));
        return modelAndView;
    }

    @RequestMapping("/profile")
    public ModelAndView getProfilePage(@AuthenticationPrincipal UserDetails user){
        ModelAndView modelAndView = new ModelAndView("profile");
        User muser = userService.findBySnpassport(user.getUsername());
        modelAndView.addObject("muser", muser);
        return modelAndView;
    }

    public VehicleDTO convertToVehicleDTO(Vehicle vehicle){
        return modelMapper.map(vehicle, VehicleDTO.class);
    }

    public Vehicle convertToVehicle(VehicleDTO vehicleDTO){
        return modelMapper.map(vehicleDTO, Vehicle.class);
    }

}
