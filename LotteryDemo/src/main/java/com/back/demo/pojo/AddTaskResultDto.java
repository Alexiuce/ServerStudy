package com.back.demo.pojo;

import lombok.Data;

@Data
public class AddTaskResultDto {
    private String code;
    private String message;
    private String taskId;
}
