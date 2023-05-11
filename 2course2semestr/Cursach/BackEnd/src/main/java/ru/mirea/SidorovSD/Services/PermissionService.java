package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Permission;
import ru.mirea.SidorovSD.Repos.PermissionRepo;

import java.util.List;

@Service
@Slf4j
public class PermissionService {

    @Autowired
    private final PermissionRepo permissionRepo;


    //

    public PermissionService(PermissionRepo permissionRepo) {
        this.permissionRepo = permissionRepo;
    }

    public List<Permission> getAll(){
        return permissionRepo.findAll();
    }
    public String  savePermission(Permission permission){
        if (isPermissionExist(permission.getIdLevel(), permission.getIdGroup())){
            return "Permission already exist";
        }
        permissionRepo.save(permission);
        return "OK";
    }

    public Boolean isPermissionExist(int idLevel, int idGroup){
        return permissionRepo.findByIdLevelAndIdGroup(idLevel, idGroup) != null;
    }

    public String deletePermission(int idLevel, int idGroup){
        if (!isPermissionExist(idLevel, idGroup)){
            return "Permission doesn't exist";
        }
        permissionRepo.deleteByIdLevelAndIdGroup(idLevel, idGroup);
        return "OK";
    }

    public List<Permission> allPermissionsByLevel(int idLevel){
        return permissionRepo.findByIdLevel(idLevel);
    }
}
