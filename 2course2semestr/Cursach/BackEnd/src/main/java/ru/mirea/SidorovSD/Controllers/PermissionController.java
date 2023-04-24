package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.PermissionService;

@RestController
@RequestMapping("/permission")
public class PermissionController {

    private final ModelMapper modelMapper;
    private final PermissionService permissionService;

    public PermissionController(ModelMapper modelMapper, PermissionService permissionService) {
        this.modelMapper = modelMapper;
        this.permissionService = permissionService;
    }
}
