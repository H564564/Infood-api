package com.infood.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class recommendModel {
    private String userid;
    private String foodid;
}
