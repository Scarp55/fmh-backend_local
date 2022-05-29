package ru.iteco.fmh.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.persistence.Column;


/**
 * Палата
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "room")
@ToString
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @NotBlank
    @Column(unique=true)
    String name;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "block_id")
    Block block;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "nurse_station_id")
    NurseStation nurseStation;

    int maxOccupancy;

    String comment;
    boolean deleted;
}
