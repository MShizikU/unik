package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Permission")
public class Permission {
    @Id
    @Column(name = "ID_permission")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iPermissionID;

    @JoinColumn(name = "ID_group", referencedColumnName = "ID_group")
    private int iGroupID;

    @JoinColumn(name = "ID_level", referencedColumnName = "ID_level")
    private int iLevelID;
}
