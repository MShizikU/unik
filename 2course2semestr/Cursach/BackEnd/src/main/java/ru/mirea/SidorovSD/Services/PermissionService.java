package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Permission;
import ru.mirea.SidorovSD.Repos.PermissionRepo;

import java.util.List;

@Service
@Slf4j
public class PermissionService {

    private final PermissionRepo permissionRepo;

    public PermissionService(PermissionRepo permissionRepo) {
        this.permissionRepo = permissionRepo;
    }

    public List<Permission> getAll(){
        return permissionRepo.findAll();
    }
    public Boolean savePermission(Permission permission){
        if (isPermissionExist(permission.getIdLevel(), permission.getIdGroup())){
            return Boolean.FALSE;
        }
        permissionRepo.save(permission);
        return Boolean.TRUE;
    }

    public Boolean isPermissionExist(int idLevel, int idGroup){
        return permissionRepo.findByIdLevelAndIdGroup(idLevel, idGroup) != null;
    }

    public Boolean deletePermission(int idLevel, int idGroup){
        if (isPermissionExist(idLevel, idGroup)){
            return Boolean.FALSE;
        }
        permissionRepo.deleteByIdLevelAndIdGroup(idLevel, idGroup);
        return Boolean.TRUE;
    }

    public List<Permission> allPermissionsByLevel(int idLevel){
        return permissionRepo.findByIdLevel(idLevel);
    }
}
