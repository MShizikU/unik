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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_group", referencedColumnName = "id_group")
    private UserLevel userLevel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_level", referencedColumnName = "id_level")
    private VehicleGroup vehicleGroup;
}
