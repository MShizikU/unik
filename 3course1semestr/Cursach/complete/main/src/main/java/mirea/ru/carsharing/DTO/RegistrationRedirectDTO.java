package mirea.ru.carsharing.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class RegistrationRedirectDTO {
    String username;
    String password;
    String roles;
}
