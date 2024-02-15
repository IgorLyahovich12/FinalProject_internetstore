package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.BatchSize;

import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;

@Data
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
    private double totalAmountBuy;

//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "user")
//    @BatchSize(size = 20)
//    private Set<Favorites> favorites;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "bonus_points_id", referencedColumnName = "bonus_points_id")
    private BonusPoints bonusPoints;

//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "user")
//    @BatchSize(size = 20)
//    private Set<Reviews> reviews;
//
//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "user")
//    @BatchSize(size = 20)
//    private Set<Orders> orders;

//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "user")
//    @BatchSize(size = 20)
//    private Set<ShoppingCart> shoppingCarts;
}