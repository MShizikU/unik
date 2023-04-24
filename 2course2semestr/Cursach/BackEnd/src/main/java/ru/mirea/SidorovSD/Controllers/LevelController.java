package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.Services.LevelService;

@RestController
@RequestMapping("/level")
public class LevelController {

    private final ModelMapper modelMapper;
    private final LevelService levelService;

    public LevelController(ModelMapper modelMapper, LevelService levelService) {
        this.modelMapper = modelMapper;
        this.levelService = levelService;
    }
}
