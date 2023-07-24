package com.example.testprojecttasc.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.math.BigDecimal;
import java.util.Date;

@Data
@SuperBuilder
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserDto extends PageDto {
    private long id;
    private int role;
    private String username;
    private String password;
    private String phone;
    private String fullName;
    private String staffCode;
    private String email;
    private BigDecimal salary;
    private int shift;
    private boolean leaderTeam;
    private boolean accessData;
    private boolean isActive;
    private Date createdAt;
    private int createdBy;
    private Date updatedAt;
    private int updatedBy;
    private boolean isDeleted;
}
