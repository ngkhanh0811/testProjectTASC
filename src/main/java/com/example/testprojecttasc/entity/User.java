package com.example.testprojecttasc.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@SuperBuilder
@Entity(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "role", nullable = false)
    private int role;
    @Column(name = "username", nullable = false)
    private String username;
    @Column(name = "password", nullable = false)
    private String password;
    @Column(name = "phone", nullable = false)
    private String phone;
    @Column(name = "full_name", nullable = false)
    private String fullName;
    @Column(name = "user_code", nullable = false)
    private String staffCode;
    @Column(name = "email", nullable = false)
    private String email;
    @Column(name = "salary", nullable = false)
    private BigDecimal salary;
    @Column(name = "shift", nullable = false)
    private int shift;
    @Column(name = "leader_team")
    private boolean leaderTeam;
    @Column(name = "access_data")
    private boolean accessData;
    @Column(name = "is_active")
    private boolean isActive;
    @Column(name = "created_at")
    private Date createdAt;
    @Column(name = "created_by")
    private int createdBy;
    @Column(name = "updated_at")
    private Date updatedAt;
    @Column(name = "updated_by")
    private int updatedBy;
    @Column(name = "is_deleted")
    private boolean isDeleted;

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<TeamUser> teamUserList;
}
