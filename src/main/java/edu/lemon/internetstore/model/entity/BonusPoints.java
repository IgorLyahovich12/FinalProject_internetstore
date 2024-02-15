package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.UUID;

@Data
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
