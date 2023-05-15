package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
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

    private final Responser responser = new Responser();

    public GroupController(ModelMapper modelMapper, GroupService groupService) {
        this.modelMapper = modelMapper;
        this.groupService = groupService;
    }

    @GetMapping("/all")
    public List<GroupDTO> getAll(){
        return groupService.findAll().stream().map(this::convertToGroupDTO).toList();
    }

    @PostMapping("/add")
    public ResponseEntity<String> addNewGroup(@RequestParam String groupName){
        return responser.createResponse(groupService.saveGroup(groupName));
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateGroup(@RequestParam int idGroup, @RequestParam String groupName){
        return responser.createResponse(groupService.updateGroup(idGroup, groupName));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteGroup(@RequestParam String groupName){
        return responser.createResponse(groupService.deleteGroup(groupName));
    }



    public GroupDTO  convertToGroupDTO( Group group){
        return modelMapper.map(group, GroupDTO.class);
    }
}
