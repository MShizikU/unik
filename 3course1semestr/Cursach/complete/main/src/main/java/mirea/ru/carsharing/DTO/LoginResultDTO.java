package mirea.ru.carsharing.DTO;

public class LoginResultDTO {
    public String jwt;

    public LoginResultDTO(String jwt) {
        this.jwt = jwt;
    }
}
