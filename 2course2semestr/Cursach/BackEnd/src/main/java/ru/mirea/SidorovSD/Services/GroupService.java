package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
        if (isGroupExist(groupName)){
            return Boolean.FALSE;
        }
        Group group  = new Group();
        group.setGroupName(groupName);
        groupRepo.save(group);
        return Boolean.TRUE;
    }

    public Boolean isGroupExist(String groupName){
        return groupRepo.findByGroupName(groupName) != null;
    }
}
