package com.infood.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infood.model.*;
import com.infood.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class foodService {
    
    @Autowired
    foodRepository foodRepository;
    
    ObjectMapper objectMapper = new ObjectMapper();

    public String findAllFood() throws JsonProcessingException
    {
        return objectMapper.writeValueAsString( ListToList(foodRepository.queryAllFood() ) ) ;
    }

    public String findFoodByUserAndWare( String user, String ware ) throws Exception 
    {
        return objectMapper.writeValueAsString( ListToList( foodRepository.queryByUserAndWare( user, ware ) )) ;
    }

    public void AddFood( String userid, foodModel food ) throws Exception 
    {
        foodRepository.addFood( userid, food);
    }

    public List<foodModel> ListToList( List<Map<String, Object>> list )
    {
        List<foodModel> result = new ArrayList<foodModel>();
        for( Map<String, Object> m: list )
        {
            foodModel tempfood = new foodModel();
            tempfood.setWareID((String) m.get("wareid"));
            tempfood.setFoodID((String) m.get("foodid") );
            tempfood.setFoodName( (String)m.get("foodname") );
            tempfood.setFoodAmount( (int)m.get("foodamount") );
            tempfood.setFoodUnit( (String)m.get("foodunit") );
            tempfood.setFoodData( (String)m.get("fooddata") );
            tempfood.setFoodTime( ( (LocalDateTime)m.get("foodtime") ).toString() );
            tempfood.setBuyTime( ( (LocalDateTime)m.get("buytime") ).toString() );
            tempfood.setFoodFrom( (String) m.get("foodfrom") );
            tempfood.setBuyFrom( (String)m.get("buyfrom") );
            tempfood.setFoodType( (String)m.get("food_type") );
            result.add(tempfood);
        }
        return result;        
    }
}