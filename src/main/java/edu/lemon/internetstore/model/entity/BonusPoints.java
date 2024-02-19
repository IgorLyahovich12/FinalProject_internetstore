package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.*;


import java.util.UUID;

@Setter
@Getter
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "bonus_points")
public final class BonusPoints {
    @Id
    @GeneratedValue
    @Column(name = "bonus_points_id")
    private UUID bonus_points_id;

    @Column(name = "points")
    private int points;

}
