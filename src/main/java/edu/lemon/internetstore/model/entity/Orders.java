package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;


import java.time.LocalDate;
import java.util.UUID;



@Setter
@Getter
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public final class Orders {
    @Id
    @GeneratedValue
    @Column(name = "order_id")
    private UUID order_id;

    @Column(name = "order_status")
    private String order_status;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    @BatchSize(size = 20)
    private Product product;

    @Column(name = "order_date")
    private LocalDate order_date;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    @BatchSize(size = 20)
    private User user;


}