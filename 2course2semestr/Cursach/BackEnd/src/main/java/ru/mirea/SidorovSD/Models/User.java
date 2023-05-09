package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "users")
public class User {

    @Id
    @Column(name = "SNPassport")
    private String snpassport;

    @Column(name = "full_name")
    private String fullname;

    @Column(name = "date_of_birth")
    private String date_of_birth;

    @Column(name = "password")
    private String password;

    @Column(name = "username")
    private String username;

    @Column(name = "role")
    private String role;

    @JoinColumn(name = "id_level", referencedColumnName = "id_level")
    private int idLevel;

    @Override
    public String toString() {
        return "User{" +
                "stSNPassport='" + snpassport + '\'' +
                ", stFullName='" + fullname + '\'' +
                ", stDateOfBirth='" + date_of_birth + '\'' +
                ", iLevelID=" + idLevel +
                '}';
    }
}
