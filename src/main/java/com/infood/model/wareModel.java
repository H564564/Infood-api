package com.infood.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class wareModel {
    private String wareID;
    private String wareName;    
    private String lastSaw;
    private String color;
}