package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;

import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;

@Setter
@Getter
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "app_user")
public final class User {
    @Id
    @GeneratedValue
    @Column(name = "user_id")
    private UUID user_id;

    @Column(name = "username")
    private String name;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "registration_date")
    private LocalDate date;

    @Column(name = "total_purchase_amount")
    private double total_amount_buy;


    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "bonus_points_id", referencedColumnName = "bonus_points_id")
    private BonusPoints bonusPoints;


}