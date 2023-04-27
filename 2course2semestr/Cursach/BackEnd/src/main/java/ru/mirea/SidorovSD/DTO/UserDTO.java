package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Level;

@Data
public class UserDTO {

    private String stSNPassport, stFullName, stDateOfBirth, stPassword, username, stRole;

    private Level level;

}
