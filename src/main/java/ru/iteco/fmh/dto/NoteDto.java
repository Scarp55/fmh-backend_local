package ru.iteco.fmh.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@ApiModel(description = "записка")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class NoteDto {
    private Integer id;

    @ApiModelProperty("идентификатор пациента")
    private PatientDto patient;
    @ApiModelProperty("суть записки")
    private String description;
    @ApiModelProperty("плановое время исполнения")
    private LocalDateTime planExecuteTime;
    @ApiModelProperty("идентификатор исполнителя")
    private UserDto executor;
    @ApiModelProperty("комментарий к записке")
    private String comment;
}
