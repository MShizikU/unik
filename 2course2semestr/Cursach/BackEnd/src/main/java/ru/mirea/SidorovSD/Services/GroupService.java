package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Repos.GroupRepo;
import ru.mirea.SidorovSD.Repos.PermissionRepo;
import ru.mirea.SidorovSD.Repos.UserRepo;
import ru.mirea.SidorovSD.Repos.VehicleRepo;

import java.util.List;

@Service
@Slf4j
public class GroupService {

    @Autowired
    private final GroupRepo groupRepo;

    @Autowired
    private final PermissionRepo permissionRepo;

    public GroupService(GroupRepo groupRepo, PermissionRepo permissionRepo) {
        this.groupRepo = groupRepo;
        this.permissionRepo = permissionRepo;
    }

    public List<Group> findAll(){
        return groupRepo.findAll();
    }

    public String saveGroup(String groupName){
        log.info(groupName);
        if (isGroupExist(groupName)){
            return "Group already exist";
        }
        Group group  = new Group();
        group.setGroupName(groupName);
        groupRepo.save(group);
        return "OK";
    }

    public String updateGroup(int idGroup, String groupName){
        Group group = groupRepo.findByIdGroup(idGroup);
        if (group == null)
            return "Group doesn't exist";
        group.setGroupName(groupName);
        groupRepo.save(group);
        return "OK";
    }

    public String deleteGroup(String groupName){
        Group group = groupRepo.findByGroupName(groupName);

        if (group == null)
            return "Group doesn't exist";
        if (!permissionRepo.findByIdGroup(group.getIdGroup()).isEmpty())
            return "Group in use";

        groupRepo.delete(group);
        return "OK";
    }

    public Boolean isGroupExist(String groupName){
        return groupRepo.findByGroupName(groupName) != null;
    }
}
