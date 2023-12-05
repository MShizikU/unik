package mirea.ru.carsharing.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "permissions")
public class Permission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_permission;

    @JoinColumn(name = "id_level", referencedColumnName = "id_level")
    private Integer idLevel;

    @JoinColumn(name = "id_group", referencedColumnName = "id_group")
    private Integer idGroup;


}
