package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.mirea.SidorovSD.DTO.LevelDTO;
import ru.mirea.SidorovSD.Models.Level;
import ru.mirea.SidorovSD.Services.LevelService;

import java.util.List;

@RestController
@RequestMapping("/api/level")
public class LevelController {

    private final ModelMapper modelMapper;
    private final LevelService levelService;

    public LevelController(ModelMapper modelMapper, LevelService levelService) {
        this.modelMapper = modelMapper;
        this.levelService = levelService;
    }

    @PostMapping("/all")
    public List<LevelDTO> getAll(){
        return levelService.findAll().stream().map(this::convertToLevelDTO).toList();
    }

    @PostMapping("/add")
    public Boolean addNewLevel(@RequestParam String levelName){
        return levelService.saveLevel(levelName);
    }

    public LevelDTO convertToLevelDTO(Level level) {
        return modelMapper.map(level, LevelDTO.class);
    }

}
