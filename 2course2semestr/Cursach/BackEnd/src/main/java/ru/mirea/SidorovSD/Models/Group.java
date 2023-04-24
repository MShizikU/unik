package ru.mirea.SidorovSD.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Vehicle_group")
public class Group {

    @Id
    @Column(name = "ID_group")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int iGroupID;

    @Column(name = "group_name")
    private String stGroupName;

}
