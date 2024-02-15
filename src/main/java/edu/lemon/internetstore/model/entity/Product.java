package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.BatchSize;
import lombok.EqualsAndHashCode;

import java.util.Set;
import java.util.UUID;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "product")
//@EqualsAndHashCode(exclude = {"categories", "reviews", "favorites", "shoppingCarts"})
public final class Product {
    @Id
    @GeneratedValue
    @Column(name = "product_id")
    private UUID product_id;

    @Column(name = "name_product")
    private String nameProduct;

    @Column(name = "description", length = 10000)
    private String description;

    @Column(name = "price")
    private double price;

    @Column(name = "stock_quantity")
    private int stock_quantity;

//    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "products")
//    @BatchSize(size = 20)
//    private Set<Provider> providers;

//    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "products")
//    @BatchSize(size = 20)
//    private Set<Categories> categories;
//
//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "product")
//    @BatchSize(size = 20)
//    private Set<Reviews> reviews;
//
//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "product")
//    @BatchSize(size = 20)
//    private Set<Favorites> favorites;

//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "product")
//    @BatchSize(size = 20)
//    private Set<ShoppingCart> shoppingCarts;
}
