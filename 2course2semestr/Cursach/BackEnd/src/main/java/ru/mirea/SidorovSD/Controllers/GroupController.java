package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.GroupService;

@RestController
@RequestMapping("/group")
public class GroupController {

    private final ModelMapper modelMapper;
    private final GroupService groupService;

    public GroupController(ModelMapper modelMapper, GroupService groupService) {
        this.modelMapper = modelMapper;
        this.groupService = groupService;
    }
}
