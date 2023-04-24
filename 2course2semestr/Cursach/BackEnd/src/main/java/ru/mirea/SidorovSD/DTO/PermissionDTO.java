package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Group;
import ru.mirea.SidorovSD.Models.Level;

@Data
public class PermissionDTO {

    private int iPermissionID;
    private Group group;
    private Level level;

}
