package com.example.testprojecttasc.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.util.List;


@Data
@NoArgsConstructor
@SuperBuilder
@Entity(name = "team")
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "avatar")
    private String avatar;
    @Column(name = "team_type", nullable = false)
    private int teamType;
    @Column(name = "team_code", nullable = false)
    private String teamCode;
    @Column(name = "team_name", nullable = false)
    private String teamName;

    @OneToMany(mappedBy = "team",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<TeamUser> teamUserList;
}


