//package edu.lemon.internetstore.model.entity;
//
//import jakarta.persistence.*;
//import lombok.*;
//import org.hibernate.annotations.BatchSize;
//
//import java.time.LocalDate;
//
//@Builder
//@Data
//@AllArgsConstructor
//@NoArgsConstructor(force = true)
//@Entity
//@Table(name = "shopping_cart")
//@IdClass(ShoppingCartId.class)
//public class ShoppingCart {
//    @Id
//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
//    @BatchSize(size = 20)
//    private Product product;
//
//    @Id
//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
//    @BatchSize(size = 20)
//    private User user;
//
//    @Column(name = "date_cart")
//    private LocalDate date;
//
//    @Column(name = "quantity")
//    private int quantity;
//}
