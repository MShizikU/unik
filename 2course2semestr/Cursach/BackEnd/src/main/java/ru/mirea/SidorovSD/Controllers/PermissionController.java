package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.PermissionDTO;
import ru.mirea.SidorovSD.Models.Permission;
import ru.mirea.SidorovSD.Services.PermissionService;

import java.util.List;

@RestController
@RequestMapping("/api/permission")
public class PermissionController {

    private final ModelMapper modelMapper;
    private final PermissionService permissionService;

    public PermissionController(ModelMapper modelMapper, PermissionService permissionService) {
        this.modelMapper = modelMapper;
        this.permissionService = permissionService;
    }

    @GetMapping("/check")
    public Boolean checkPermission(@RequestParam int idLevel, int idGroup){
        return permissionService.isPermissionExist(idLevel, idGroup);
    }

    @GetMapping("/allByIdLevel")
    public List<PermissionDTO> getAllByIdLevel(@RequestParam int idLevel){
        return permissionService.allPermissionsByLevel(idLevel).stream().map(this::convertToPermissionDTO).toList();
    }

    @PostMapping("/save")
    public Boolean savePermission(@RequestBody PermissionDTO permissionDTO){
        return permissionService.savePermission(convertToPermission(permissionDTO));
    }

    @DeleteMapping("")
    public Boolean deletePermission(@RequestBody PermissionDTO permissionDTO){
        return permissionService.deletePermission(permissionDTO.getLevel().getIdLevel(), permissionDTO.getGroup().getIdGroup());
    }

    public PermissionDTO convertToPermissionDTO(Permission permission){
        return modelMapper.map(permission, PermissionDTO.class);
    }

    public Permission convertToPermission(PermissionDTO permissionDTO){
        return modelMapper.map(permissionDTO, Permission.class);
    }

}
