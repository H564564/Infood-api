package com.infood.model;

import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
public class foodModel {
    private String wareID;
    private String foodID;
    private String foodName;
    private int foodAmount;
    private String foodUnit;
    private String foodData;
    private String foodTime;
    private String buyTime;
    private String foodFrom;
    private String buyFrom;
    private String foodType;

}

