package mirea.ru.carsharing.DTO;

import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegistrationDTO {
    private Long snpassport;

    private String fullName;

    private String username;

    private LocalDate dateOfBirth;

    private String password;
}
