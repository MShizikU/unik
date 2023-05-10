package ru.mirea.SidorovSD.DTO;

import lombok.Data;
import ru.mirea.SidorovSD.Models.Level;

@Data
public class UserDTO {

    private String snpassport, fullName, dateOfBirth, username;

    private int idLevel;

}
