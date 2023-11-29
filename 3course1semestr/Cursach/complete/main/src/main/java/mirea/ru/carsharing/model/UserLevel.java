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
@Table(name = "user_level")
public class UserLevel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_level")
    private Integer idLevel;

    @Column(name = "level_name")
    private String levelName;

    @Column(name = "level_description")
    private String levelDescription;

    @Column(name = "count_users")
    private Integer countUsers;
}
