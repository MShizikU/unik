package ru.mirea.SidorovSD.Controllers;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
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

    private final Responser responser = new Responser();

    public LevelController(ModelMapper modelMapper, LevelService levelService) {
        this.modelMapper = modelMapper;
        this.levelService = levelService;
    }

    @GetMapping("/all")
    public List<LevelDTO> getAll(){
        return levelService.findAll().stream().map(this::convertToLevelDTO).toList();
    }

    @GetMapping("/id")
    public LevelDTO getLevelByID(@RequestParam int idLevel){
        return convertToLevelDTO(levelService.findById(idLevel));
    }

    @PostMapping("/add")
    public ResponseEntity<String> addNewLevel(@RequestParam String levelName){
        return responser.createResponse(levelService.saveLevel(levelName));
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateLevel(@RequestParam int idLevel, @RequestParam String levelName){
        return responser.createResponse(levelService.updateLevel(idLevel, levelName));
    }

    @DeleteMapping()
    public ResponseEntity<String> deleteLevel(@RequestParam String levelName){
        return responser.createResponse(levelService.deleteLevel(levelName));
    }


    public LevelDTO convertToLevelDTO(Level level) {
        return modelMapper.map(level, LevelDTO.class);
    }

}
