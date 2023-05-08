package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import ru.mirea.SidorovSD.DTO.GroupDTO;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Services.GroupService;

import java.util.List;

@RestController
@RequestMapping("/api/group")
public class GroupController {

    private final ModelMapper modelMapper;
    private final GroupService groupService;

    public GroupController(ModelMapper modelMapper, GroupService groupService) {
        this.modelMapper = modelMapper;
        this.groupService = groupService;
    }

    @PostMapping("/all")
    public List<GroupDTO> getAll(){
        return groupService.findAll().stream().map(this::convertToGroupDTO).toList();
    }

    @PostMapping("/add")
    public Boolean addNewGroup(@RequestParam String groupName){
        return groupService.saveGroup(groupName);
    }

    @PostMapping("/update")
    public Boolean updateGroup(@RequestParam int idGroup, @RequestParam String groupName){
        return groupService.updateGroup(idGroup, groupName);
    }

    @DeleteMapping()
    public Boolean deleteGroup(@RequestParam int idGroup){
        return groupService.deleteGroup(idGroup);
    }



    public GroupDTO  convertToGroupDTO( Group group){
        return modelMapper.map(group, GroupDTO.class);
    }
}
