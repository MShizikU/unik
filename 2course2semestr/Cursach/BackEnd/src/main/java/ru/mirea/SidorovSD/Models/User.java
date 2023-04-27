package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Users")
public class User {

    @Id
    @Column(name = "SNPassport")
    private String stSNPassport;

    @Column(name = "full_name")
    private String stFullName;

    @Column(name = "date_of_birth")
    private String stDateOfBirth;

    @JoinColumn(name = "ID_level", referencedColumnName = "ID_level")
    private int iLevelID;

    @Override
    public String toString() {
        return "User{" +
                "stSNPassport='" + stSNPassport + '\'' +
                ", stFullName='" + stFullName + '\'' +
                ", stDateOfBirth='" + stDateOfBirth + '\'' +
                ", iLevelID=" + iLevelID +
                '}';
    }
}
