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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_model")
    private VehicleModel vehicleModel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_brand")
    private VehicleBrand vehicleBrand;

}
