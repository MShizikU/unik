package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
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

    @GetMapping("/all")
    public List<LevelDTO> getAll(){
        return levelService.findAll().stream().map(this::convertToLevelDTO).toList();
    }

    @GetMapping("/id")
    public LevelDTO getLevelByID(@RequestParam int idLevel){}

    @PostMapping("/add")
    public Boolean addNewLevel(@RequestParam String levelName){
        return levelService.saveLevel(levelName);
    }

    @PostMapping("/update")
    public Boolean updateLevel(@RequestParam int idLevel, @RequestParam String levelName){
        return levelService.updateLevel(idLevel, levelName);
    }

    @DeleteMapping()
    public Boolean deleteLevel(@RequestParam int idLevel){
        return levelService.deleteLevel(idLevel);
    }


    public LevelDTO convertToLevelDTO(Level level) {
        return modelMapper.map(level, LevelDTO.class);
    }

}
