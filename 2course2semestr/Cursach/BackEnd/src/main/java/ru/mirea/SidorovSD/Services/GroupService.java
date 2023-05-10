package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Repos.GroupRepo;

import java.util.List;

@Service
@Slf4j
public class GroupService {

    @Autowired
    private final GroupRepo groupRepo;

    public GroupService(GroupRepo groupRepo) {
        this.groupRepo = groupRepo;
    }

    public List<Group> findAll(){
        return groupRepo.findAll();
    }

    public Boolean saveGroup(String groupName){
        log.info(groupName);
        if (isGroupExist(groupName)){
            return Boolean.FALSE;
        }
        Group group  = new Group();
        group.setGroupName(groupName);
        groupRepo.save(group);
        return Boolean.TRUE;
    }

    public Boolean updateGroup(int idGroup, String groupName){
        Group group = groupRepo.findByIdGroup(idGroup);
        if (group == null)
            return false;
        group.setGroupName(groupName);
        groupRepo.save(group);
        return true;
    }

    public Boolean deleteGroup(String groupName){
        Group group = groupRepo.findByGroupName(groupName);
        if (group == null)
            return false;
        groupRepo.delete(group);
        return true;
    }

    public Boolean isGroupExist(String groupName){
        return groupRepo.findByGroupName(groupName) != null;
    }
}
