package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;

import java.util.Set;
import java.util.UUID;

@Setter
@Getter
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
    private String name_company;

    @Column(name = "country")
    private String country;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(
            name = "product_provider",
            joinColumns = @JoinColumn(name = "provider_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    @BatchSize(size = 20)
    private Set<Product> products;


}