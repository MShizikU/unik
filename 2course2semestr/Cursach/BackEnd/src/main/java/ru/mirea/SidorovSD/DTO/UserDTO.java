package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Level;

@Data
public class UserDTO {

    private String snpassport, fullName, dateOfBirth, password, username, role;

    private Level level;

}
