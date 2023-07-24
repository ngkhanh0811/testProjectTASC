package com.example.testprojecttasc.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class TeamDto {
    private long id;
    private String avatar;
    private int teamType;
    private String teamCode;
    private String teamName;
}
