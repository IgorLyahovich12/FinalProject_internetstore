package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.BatchSize;

import java.util.Set;
import java.util.UUID;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "provider")
public final class Provider {
    @Id
    @GeneratedValue
    @Column(name = "provider_id")
    private UUID provider_id;

    @Column(name = "name_company")
    private String nameCompany;

    @Column(name = "country")
    private String country;

//    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinTable(
//            name = "Product_Provider",
//            joinColumns = @JoinColumn(name = "provider_id"),
//            inverseJoinColumns = @JoinColumn(name = "product_id")
//    )
//    @BatchSize(size = 20)
//    private Set<Product> products;
}