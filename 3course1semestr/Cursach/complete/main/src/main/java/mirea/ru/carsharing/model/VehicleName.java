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
@Table(name = "vehicle_name")
public class VehicleName {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vehicle_name")
    private Integer idVehicleName;

    @JoinColumn(name = "id_model")
    private Integer idModel;

    @JoinColumn(name = "id_brand")
    private Integer idBrand;

}
