package mirea.ru.carsharing.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "rents")
public class Rent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_rent")
    private Integer idRent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "snpassport")
    private User user;

    @Column(name = "duration")
    private Integer duration;

    @Column(name = "starting_point")
    private String startingPoint;

    @Column(name = "start_time")
    private LocalDateTime startTime;

    @Column(name = "end_time")
    private LocalDateTime endTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vin")
    private Vehicle vehicle;

    @Column(name = "ending_point")
    private String endingPoint;
}
